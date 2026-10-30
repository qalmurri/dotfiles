# dwm (X11)

`install.sh` memasang dwm dari AUR menggunakan `makepkg`; konfigurasi default paket digunakan. Skrip tidak mengubah source atau konfigurasi dwm.

Untuk kustomisasi, salin `config.def.h` dari source dwm yang dipakai menjadi `config.h`, lalu simpan patch dan catat versi/commit upstream di direktori ini. Integrasi build kustom belum otomatis; perbarui PKGBUILD lokal atau gunakan paket AUR yang kamu rawat sendiri agar perubahan dapat dibangun ulang dengan pacman.

Folder ini menyimpan konfigurasi milik repo, bukan source upstream.
