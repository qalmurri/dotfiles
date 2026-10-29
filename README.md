# dotfiles

Repository untuk mengelola konfigurasi Arch Linux, aplikasi pengguna, serta window manager `dwm` (X11) dan `dwl` (Wayland).

## Struktur

- `stow/` — konfigurasi di home directory yang dikelola dengan GNU Stow.
- `wm/dwm/` — konfigurasi, patch, dan skrip terkait dwm.
- `wm/dwl/` — konfigurasi, patch, dan skrip terkait dwl.
- `arch/packages/` — daftar paket Arch Linux per lingkungan.
- `arch/etc/` — catatan/template konfigurasi sistem yang perlu dipasang secara terpisah.
- `scripts/` — skrip pembantu repository.

Direktori ini merupakan kerangka awal. File `.gitkeep` hanya menjaga direktori kosong tetap terlihat; ganti dengan konfigurasi milikmu saat siap.

## Menghubungkan konfigurasi dengan GNU Stow

Install Stow:

```bash
sudo pacman -S stow
```

Dari root repository, hubungkan paket yang sudah kamu isi:

```bash
./scripts/stow.sh shell nvim
```

Lepas symlink paket:

```bash
./scripts/stow.sh -D shell nvim
```

Periksa atau cadangkan file tujuan yang sudah ada sebelum menjalankan Stow agar tidak terjadi konflik.

## dwm dan dwl

Simpan `config.h`, patch, dan skrip khusus pada direktori window manager masing-masing. Simpan source upstream secara terpisah atau gunakan submodule; README di masing-masing direktori menjelaskan alur yang disarankan.

## Keamanan

Jangan commit private key, token, kata sandi, file `.env`, kredensial, atau konfigurasi mesin yang sensitif. File di `arch/etc/` perlu ditinjau manual dan biasanya dipasang dengan hak akses administrator.
