#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v stow >/dev/null 2>&1; then
  printf 'GNU Stow belum terpasang. Instal dengan: sudo pacman -S stow\n' >&2
  exit 1
fi

if [[ $# -eq 0 ]]; then
  printf 'Pemakaian: %s [opsi stow] paket...\n' "$0" >&2
  printf 'Contoh: %s shell nvim\n' "$0" >&2
  printf 'Lepas symlink: %s -D shell nvim\n' "$0" >&2
  exit 2
fi

exec stow -d "$ROOT/stow" -t "$HOME" "$@"
