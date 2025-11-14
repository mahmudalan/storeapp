# My Store - Flutter Catalog App

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-Framework-blue?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-Language-blue?logo=dart&logoColor=white)](https://dart.dev/)
[![FakeStoreAPI](https://img.shields.io/badge/API-FakeStoreAPI-yellow)](https://fakestoreapi.com/)

<!-- Ganti URL gambar di bawah ini dengan link ke screenshot atau GIF dari aplikasimu jika kamu punya -->
<!-- <img src="path/to/your/app_screenshot.png" alt="Aplikasi Screenshot" width="200"/> -->

</div>

## Deskripsi

**My Store** adalah aplikasi katalog produk mobile yang dibangun menggunakan framework **Flutter**. Aplikasi ini menampilkan berbagai produk dari Fake Store API, memungkinkan pengguna untuk menjelajahi, mencari, dan melihat detail produk secara menyeluruh.

## Fitur

- **Tampilan Katalog Produk**: Menampilkan daftar produk dengan gambar, nama, harga, dan rating.
- **Navigasi Detail Produk**: Menyediakan halaman detail produk yang menampilkan informasi lengkap seperti gambar besar, judul, kategori, harga, deskripsi, dan rating.
- **Filter Kategori**: Memungkinkan pengguna untuk menyaring produk berdasarkan kategori tertentu menggunakan *chip* kategori yang dapat digulir secara horizontal.
- **Pencarian Produk**: Menyediakan kotak pencarian untuk mencari produk berdasarkan nama, deskripsi, atau kategori.
- **Manajemen State dengan Provider**: Menggunakan `Provider` untuk mengelola state aplikasi secara efisien, termasuk data produk, filter, dan status loading.

## Package yang Digunakan

- `provider`: Untuk manajemen state global.
- `http`: Untuk melakukan permintaan HTTP ke API.
- `flutter` (SDK): Framework utama untuk pengembangan aplikasi mobile.

## Petunjuk Menjalankan Aplikasi

1.  Pastikan kamu telah menginstal [Flutter](https://flutter.dev/docs/get-started/install) di komputermu.
2.  Clone repositori ini ke direktori lokal:
    ```bash
    git clone https://github.com/[NAMA_KAMU]/[NAMA_REPOSITORI].git
    ```
3.  Masuk ke direktori proyek:
    ```bash
    cd [NAMA_REPOSITORI]
    ```
4.  Ambil dependensi yang diperlukan:
    ```bash
    flutter pub get
    ```
5.  Jalankan aplikasi:
    ```bash
    flutter run
    ```

## Kontribusi

Kontribusi sangat dianjurkan! Jika kamu menemukan *bug* atau memiliki saran *feature* baru, silakan buka *issue* atau kirimkan *pull request*.


