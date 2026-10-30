# Arch Linux minimal + dwm

Starter ini menambahkan sesi X11 dengan dwm ke instalasi Arch Linux minimal yang sudah berjalan. Kernel, bootloader, jaringan, dan partisi harus sudah disiapkan sebelumnya.

## Instalasi

Jalankan sebagai user biasa yang memiliki `sudo`:

```bash
git clone <url-repo> dotfiles
cd dotfiles
bash install.sh
```

Skrip memasang `xorg-server`, `xorg-xinit`, `alacritty`, `dmenu`, `xorg-xsetroot`, `base-devel`, dan `git` melalui pacman. dwm dibangun dari PKGBUILD AUR menggunakan `makepkg`; skrip mengubah binding terminal dwm menjadi Alacritty. Tinjau PKGBUILD dan konfirmasi prompt yang ditampilkan. Tidak ada display manager.

Skrip membuat `~/.xinitrc` dan menambahkan autostart `startx` pada login lokal TTY1 ke `~/.bash_profile`. File yang sudah ada tidak ditimpa. Jika `.xinitrc` sudah ada, pastikan file itu berakhir dengan `exec dwm`; jika `.bash_profile` punya alur login khusus, periksa blok `dotfiles-dwm-startx` setelah instalasi.

Logout lalu login kembali pada TTY1 untuk memulai dwm. Pada instalasi headless atau mesin virtual, driver grafis mungkin perlu disiapkan tersendiri.

## Kontrol dwm bawaan

- `Alt+Shift+Enter`: buka Alacritty.
- `Alt+p`: buka dmenu.
- `Alt+Shift+q`: keluar dari dwm.

Konfigurasi dwm dikompilasi saat build paket AUR. Untuk mengubah keybind atau tampilan, sesuaikan PKGBUILD dan `config.h` di proses build dwm; README di `wm/dwm/` menjelaskan direktori konfigurasi repo.

## Isi repo

- `arch/packages/`: daftar paket per kebutuhan.
- `home/`: konfigurasi yang dapat ditempatkan ke home directory.
- `wm/`: catatan konfigurasi window manager.
- `install.sh`: pemasangan dwm minimal untuk Arch yang sudah terinstal.

Skrip dapat dijalankan ulang. Paket yang terpasang dilewati oleh pacman, dan blok autostart tidak ditambahkan dua kali.
