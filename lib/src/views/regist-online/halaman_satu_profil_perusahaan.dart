import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/texts/texts.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/views/regist-online/web_socket_page.dart';
import 'package:forex_regol/src/views/utilities/numbered_text_list.dart';
import 'package:forex_regol/src/views/utilities/statement_text.dart';
import 'package:forex_regol/src/views/utilities/table_company_profile.dart';
import 'package:forex_regol/src/views/utilities/table_list_director.dart';
import 'package:get/get.dart';

import 'halaman_dua_pemilihan_produk.dart';

class HalamanSatuProfilPerusahaan extends StatefulWidget {
  const HalamanSatuProfilPerusahaan({super.key});

  @override
  State<HalamanSatuProfilPerusahaan> createState() => _HalamanSatuProfilPerusahaanState();
}

class _HalamanSatuProfilPerusahaanState extends State<HalamanSatuProfilPerusahaan> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      onPressed: (){
        Get.to(() => const HalamanDuaPemilihanProduk());
      },
      children: [
        CustomText.titleHeadingPage(context, text: "PROFIL PERUSAHAAN PIALANG BERJANGKA"),
        TableCompanyProfile(data: {
          'Nama': 'PT. VIG Group Futures',
          'Alamat': 'Menara Prima Lt.5 unit I & J. Jl.Dr.Ide Anak Agung Gde Agung blok 6.2 Kuningan Timur Setiabudi Jakarta selatan 12950',
          'No. Telepon': '021 30410888',
          'Faksimili': '021-30007120',
          'E-mail': 'info@vigfutures.co.id',
          'Home-page': 'https://www.vigfutures.co.id',
        }),

        const SizedBox(height: 20.0),
        CustomText.titleSubHead(context, text: "Susunan Pengurus Perusahaan"),
        TableListDirector(title: "Dewan Direksi", data: {
          'Direktur Utama': 'Saputra Budianto S.Kom',
          'Direktur Kepatuhan': 'John Khannedy S.Psi',
          'Direktur Operasional': 'Renald Arsed S.Pd',
        }),
        TableListDirector(title: "Dewan Komisaris", data: {
          'Komisaris Utama': 'Jastiska Dwi Wanda S.Pd',
          'Komisaris': 'Menara Prima Lt.5 unit I & J. Jl.Dr.Ide Anak Agung Gde Agung blok 6.2 Kuningan Timur Setiabudi Jakarta selatan 12950',
        }),
        const Divider(color: Colors.black12),
        TableListDirector(title: "", removeTitle: true, data: {
          'Susunan Pemegang Saham Perusahaan': '1. PT. VIG Group Jakarta\n2. Tang Jie',
          'Nomor dan Tanggal Izin Usaha dari Bappebti': '001/BAPPEBTI/SI/01/2025 Tanggal: 2025-01-03',
          'Nomor dan Tanggal Keanggotaan Bursa Berjangka': 'SPAB/193/BBJ/11/2024 Tanggal: 2024-11-04',
          'Nomor dan Tanggal Keanggotaan Lembaga Kliring Berjangka': '170/AK-KBI/XI/2024 Tanggal: 2024-11-20',
          'Nomor dan Tanggal Persetujuan sebagai Peserta Sistem Perdagangan Alternatif': '01/BAPPEBTI/SPA/03/2025 Tanggal: 2025-03-26',
          'Nama Penyelenggara Sistem Perdagangan Alternatif': 'PT World Index Investment (WII)',
          'Kontrak Berjangka Yang Diperdagangkan*)': '1. JFX/JAFETSNOW',
          'Kontrak Derivatif Syariah Yang Diperdagangkan*)': 'emas (GOLD 10,GOLD 100,GOLD 250) Minyak sawit (\nOLE 01, OLE 10, OLE ) Kakao (CC5), KOPI ARABIKA\n(ACF), KOPI ROBUSTA (RCF), INDEKS EMAS (KBIE)',
          'Kontrak Derivatif dalam Sistem Perdagangan Alternatif*)': '1. Komoditi Emas ( XAUUSD, XAGUSD, USOIL )',
          'Kontrak Derivatif dalam Sistem Perdagangan Alternatif dengan volume minimum 0,1 (nol koma satu) lot Yang Diperdagangkan*)': '1. Komoditi Emas ( XAUUSD, XAGUSD, USOIL )',
          'Biaya rincian yang dibebankan pada Nasabah*)': 'Terlampir Pada Trading Rules (Peraturan\nPerdagangan)',
          'Nomor atau alamat email jika terjadi keluhan': '021 - 30007118 / pengaduan@vigfutures.co.id',
        }),
        NumberedTextList(
          title: 'Sarana penyelesaian perselisihan yang dipergunakan apabila terjadi perselisihan :',
          subtitle: 'Penyelesaian Perselisihan Mempergunakan Sarana Melalui Prosedur Sebagai Berikut.',
          items: [
            'Semua perselisihan dan perbedaan pendapat yang mungkin timbul dalam pelaksanaan perjanjian ini wajib di selesaikan terlebih dahulu secara musyawarah dan mufakat antara para pihak',
            'Apabila perselisihan dan perbedaan pendapat yang timbul tidak dapat di selesaikan secara musyawarah untuk mencapai mufakat, para pihak wajib memanfaatkan sarana penyelesaian perselisihan yang tersedia di Bursa Berjangka',
            'Apabila perselisihan dan perbedaan pendapat yang timbul tidak dapat di selesaikan melalui cara di maksud pada angka (1) dan angka (2), maka para pihak sepakat untuk menyelesaikan perselisihan melalui Badan Arbitrase Perdagangan Berjangka Komoditi (BAKTI) berdasarkan peraturan dan prosedur Badan Arbitrase Perdagangan Berjangka Komoditi (BAKTI)/ Pengadilan Negeri Jakarta – Selatan.',
          ],
        ),
        NumberedTextList(
          title: 'Nama-Nama Wakil Pialang Berjangka yang Bekerja di Perusahaan Pialang Berjangka :',
          subtitle: '',
          items: [
            'Fachrul Zain',
            'Rizqia Irhamna Putri',
            'Vilma Villameva',
          ],
        ),
        NumberedTextList(
          title: 'Nama-Nama Wakil Pialang Berjangka yang secara khusus ditunjuk oleh Pialang Berjangka untuk melakukan verifikasi dalam rangka penerimaan Nasabah elektronik online :',
          subtitle: '',
          items: [
            'Vilma Villameva',
          ],
        ),
        NumberedTextList(
          title: 'Nomor Rekening Terpisah (Segregated Account) Perusahaan Pialang Berjangka :',
          subtitle: '',
          items: [
            'Bank BCA KCU Chase Plaza Sudirman \n035-328-9991 (IDR)',
            'Bank BCA KCU Chase Plaza Sudirman \n035-329-9902 (USD)',
          ],
        ),
        StatementTextWidget(dynamicTitlePart: "PROFIL PERUSAHAAN PIALANG BERJANGKA")
      ],
    );
  }
}