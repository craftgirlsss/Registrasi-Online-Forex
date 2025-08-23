import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/texts/texts.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/views/regist-online/success_page.dart';
import 'package:forex_regol/src/views/utilities/process_table.dart';
import 'package:get/get.dart';

class HalamanTigaBelasVerifikasiKelengkapan extends StatefulWidget {
  const HalamanTigaBelasVerifikasiKelengkapan({super.key});

  @override
  State<HalamanTigaBelasVerifikasiKelengkapan> createState() => _HalamanTigaBelasVerifikasiKelengkapan();
}

class _HalamanTigaBelasVerifikasiKelengkapan extends State<HalamanTigaBelasVerifikasiKelengkapan> {

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> processList = [
      {"no": 1, "proses": "PROFIL PERUSAHAAN PIALANG BERJANGKA", "status": true},
      {
        "no": 2,
        "proses":
        "PERNYATAAN TELAH MELAKUKAN SIMULASI PERDAGANGAN BERJANGKA ATAU PERNYATAAN TELAH BERPENGALAMAN DALAM MELAKSANAKAN TRANSAKSI PERDAGANGAN BERJANGKA",
        "status": true
      },
      {"no": 3, "proses": "PERNYATAAN PENGUNGKAPAN (DISCLOSURE STATEMENT)", "status": true},
      {"no": 4, "proses": "APLIKASI PEMBUKAAN REKENING TRANSAKSI", "status": true},
      {"no": 5, "proses": "PERNYATAAN PENGUNGKAPAN (DISCLOSURE STATEMENT)", "status": true},
      {"no": 6, "proses": "DOKUMEN PEMBERITAHUAN ADANYA RISIKO", "status": true},
      {"no": 7, "proses": "PERNYATAAN PENGUNGKAPAN (DISCLOSURE STATEMENT)", "status": true},
      {"no": 8, "proses": "PERJANJIAN PEMBERIAN AMANAT", "status": true},
      {
        "no": 9,
        "proses":
        "DAFTAR KONTRAK BERJANGKA, KONTRAK DERIVATIF DAN KONTRAK DERIVATIF LAINNYA BESERTA PERATURAN PERDAGANGAN (TRADING RULES)",
        "status": true
      },
      {
        "no": 10,
        "proses":
        "PERNYATAAN BERTANGGUNG JAWAB ATAS KODE AKSES TRANSAKSI NASABAH (Personal Access Password)",
        "status": true
      },
      {
        "no": 11,
        "proses":
        "PERNYATAAN BAHWA DANA YANG DIGUNAKAN SEBAGAI MARGIN MERUPAKAN DANA MILIK NASABAH SENDIRI",
        "status": true
      },
      {
        "no": 12,
        "proses":
        "VERIFIKASI KELENGKAPAN PROSES PENERIMAAN NASABAH SECARA ELEKTRONIK ONLINE",
        "status": true
      },
    ];
    return DefaultScaffold(
      onPressed: (){
        Get.to(() => const SuccessPage());
      },
      withBottomMenu: true,
      title: "",
      children: [
        CustomText.titleMedium(context, text: "PERNYATAAN BAHWA DANA YANG DIGUNAKAN SEBAGAI MARGIN MERUPAKAN DANA MILIK NASABAH SENDIRI"),
        const SizedBox(height: 15.0),
        ProcessTable(processes: processList),
        const SizedBox(height: 15),
        CustomText.normal(context, bold: true, text: """Dengan mengisi kolom “YA” di bawah, saya menyatakan bahwa saya telah membaca dan memahami seluruh isi dokumen yang disampaikan dalam FORMULIR NOMOR 1 sampai dengan FORMULIR NOMOR 12.""", align: TextAlign.justify),
        const SizedBox(height: 15),
        CustomText.normal(context, text: "Demikian Pernyataan ini dibuat dengan sebenarnya dalam keadaan sadar, sehat jasmani dan rohani serta tanpa paksaan apapun dari pihak manapun.", align: TextAlign.justify),
      ],
    );
  }
}