import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/views/utilities/numbered_text_list.dart';
import 'package:get/get.dart';

import 'halaman_enam_aplikasi_pembukaan_rekening.dart' show HalamanEnamAplikasiPembukaanRekening;

class HalamanLimaPernyataanPengungkapan extends StatefulWidget {
  const HalamanLimaPernyataanPengungkapan({super.key});

  @override
  State<HalamanLimaPernyataanPengungkapan> createState() => _HalamanLimaPernyataanPengungkapanState();
}

class _HalamanLimaPernyataanPengungkapanState extends State<HalamanLimaPernyataanPengungkapan> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: "Pernyataan Pengungkapan #1",
      onPressed: () => Get.to(() => const HalamanEnamAplikasiPembukaanRekening()),
      withBottomMenu: true,
      children: [
        NumberedTextList(
          title: 'PERNYATAAN PENGUNGKAPAN',
          subtitle: '(DISCLOSURE STATEMENT)',
          items: [
            'Perdagangan Berjangka BERISIKO SANGAT TINGGI tidak cocok untuk semua orang. Pastikan bahwa anda SEPENUHNYA MEMAHAMI RISIKO ini sebelum melakukan perdagangan.',
            'Perdagangan Berjangka merupakan produk keuangan dengan leverage dan dapat menyebabkan KERUGIAN ANDA MELEBIHI setoran awal Anda. Anda harus siap apabila SELURUH DANA ANDA HABIS.',
            'TIDAK ADA PENDAPATAN TETAP (FIXED INCOME) dalam Perdagangan Berjangka.',
            'Apabila anda PEMULA kami sarankan untuk mempelajari mekanisme transaksinya, PERDAGANGAN BERJANGKA membutuhkan pengetahuan dan pemahaman khusus.',
            'ANDA HARUS MELAKUKAN TRANSAKSI SENDIRI, segala risiko yang akan timbul akibat transaksi sepenuhnya akan menjadi tanggung jawab Saudara.',
            'User id dan password BERSIFAT PRIBADI DAN RAHASIA, anda bertanggung jawab atas penggunaannya, JANGAN SERAHKAN ke pihak lain terutama Wakil Pialang Berjangka dan pegawai Pialang Berjangka.',
            'ANDA berhak menerima LAPORAN ATAS TRANSAKSI yang anda lakukan. Waktu anda 2 X 24 JAM UNTUK MEMBERIKAN SANGGAHAN. Untuk transaksi yang TELAH SELESAI (DONE/SETTLE) DAPAT ANDA CEK melalui sistem informasi transaksi nasabah yang berfungsi untuk memastikan transaksi anda telah terdaftar di Lembaga Kliring Berjangka.'
          ],
        ),
      ]
    );
  }
}
