#!/usr/bin/env bash
set -Eeuo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
USER_HOME="${HOME:?HOME tidak terdefinisi}"
PROFILE="$USER_HOME/.bash_profile"
XINITRC="$USER_HOME/.xinitrc"
MARKER="# dotfiles-dwm-startx"

fail() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

[[ -f /etc/arch-release ]] || fail "Skrip ini hanya untuk Arch Linux."
[[ "$EUID" -ne 0 ]] || fail "Jalankan sebagai user biasa, bukan root. Skrip memakai sudo saat diperlukan."
command -v sudo >/dev/null || fail "sudo belum terpasang. Pasang sudo, lalu jalankan ulang."
command -v pacman >/dev/null || fail "pacman tidak ditemukan."

mapfile -t runtime_packages < <(sed '/^[[:space:]]*#/d; /^[[:space:]]*$/d' "$REPO_DIR/arch/packages/dwm.txt")
mapfile -t build_packages < <(sed '/^[[:space:]]*#/d; /^[[:space:]]*$/d' "$REPO_DIR/arch/packages/development.txt")

printf 'Memasang paket X11 dan kebutuhan build dwm...\n'
sudo pacman -S --needed "${runtime_packages[@]}" "${build_packages[@]}"

command -v makepkg >/dev/null || fail "makepkg tidak ditemukan setelah memasang base-devel."

printf 'Mengambil PKGBUILD dwm dari AUR. Periksa PKGBUILD sebelum menyetujui build.\n'
build_dir="$(mktemp -d "${TMPDIR:-/tmp}/dwm-build.XXXXXX")"
cleanup() { rm -rf -- "$build_dir"; }
trap cleanup EXIT
git clone https://aur.archlinux.org/dwm.git "$build_dir/dwm"
(
  cd "$build_dir/dwm"
  makepkg -si
)

if [[ -e "$XINITRC" || -L "$XINITRC" ]]; then
  printf 'Mempertahankan %s yang sudah ada. Pastikan file tersebut menjalankan `exec dwm`.\n' "$XINITRC"
else
  install -m 0644 "$REPO_DIR/home/x11/.xinitrc" "$XINITRC"
  printf 'Dibuat %s\n' "$XINITRC"
fi

if [[ ! -e "$PROFILE" && ! -L "$PROFILE" ]]; then
  cat > "$PROFILE" <<'EOF'
# Muat konfigurasi shell interaktif.
[[ -f ~/.bashrc ]] && . ~/.bashrc
EOF
  chmod 0644 "$PROFILE"
fi

if ! grep -Fq "$MARKER" "$PROFILE"; then
  cat >> "$PROFILE" <<'EOF'

# dotfiles-dwm-startx
# Mulai sesi X hanya pada login lokal di TTY pertama.
if [[ -z "${DISPLAY:-}" && "$(tty 2>/dev/null)" == /dev/tty1 ]]; then
  exec startx
fi
EOF
  printf 'Autostart X pada login TTY1 ditambahkan ke %s\n' "$PROFILE"
else
  printf 'Autostart dwm sudah terpasang di %s\n' "$PROFILE"
fi

printf '\nInstalasi selesai. Logout lalu login di TTY1 untuk membuka dwm.\n'
printf 'Buka terminal dengan Alt+Shift+Enter; keluar dari dwm dengan Alt+Shift+Q.\n'
