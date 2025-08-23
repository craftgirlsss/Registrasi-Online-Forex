import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/texts/texts.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/views/utilities/numbered_agreement_list.dart';
import 'package:forex_regol/src/views/utilities/numbered_text_list.dart';
import 'package:forex_regol/src/views/utilities/statement_text.dart';
import 'package:get/get.dart';

import 'halaman_sembilan_perjanjian_pemberian_amanat.dart';

class HalamanDelapanFormulirRisiko extends StatefulWidget {
  const HalamanDelapanFormulirRisiko({super.key});

  @override
  State<HalamanDelapanFormulirRisiko> createState() => _HalamanDelapanFormulirRisiko();
}

class _HalamanDelapanFormulirRisiko extends State<HalamanDelapanFormulirRisiko> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      withBottomMenu: true,
      title: "Formulir Dokumen Resiko untuk Transaksi Kontrak Derivatif Dalam Sistem Perdagangan Alternatif",
      onPressed: (){
        Get.to(() => const HalamanSembilanPerjanjianPemberianAmanat());
      },
      children: [
        CustomText.titleHeadingPage(context, text: "DOKUMEN PEMBERITAHUAN ADANYA RISIKO YANG HARUS DISAMPAIKAN OLEH PIALANG BERJANGKA UNTUK TRANSAKSI KONTRAK DERIVATIF DALAM SISTEM PERDAGANGAN ALTERNATIF"),
        NumberedAgreementList(
          items: [
            'Perdagangan Kontrak Derivatif Dalam Sistem Perdagangan Alternatif mempunyai risiko dan mempunyai kemungkinan kerugian yang tidak terbatas yang jauh lebih besar dari jumlah uang yang disetor (Margin) ke Pialang Berjangka. Kontrak Derivatif Dalam Sistem Perdagangan Alternatif sama dengan produk keuangan lainnya yang mempunyai risiko tinggi, Anda sebaiknya tidak menaruh risiko terhadap dana yang Anda tidak siap untuk menderita rugi, seperti tabungan pensiun, dana kesehatan atau dana untuk keadaan darurat, dana yang disediakan untuk pendidikan atau kepemilikan rumah, dana yang diperoleh dari pinjaman pendidikan atau gadai, atau dana yang digunakan untuk memenuhi kebutuhan sehari-hari.',
            'Berhati-hatilah terhadap pernyataan bahwa Anda pasti mendapatkan keuntungan besar dari perdagangan Kontrak Derivatif Dalam Sistem Perdagangan Alternatif. Meskipun perdagangan Kontrak Derivatif Dalam Sistem Perdagangan Alternatif dapat memberikan keuntungan yang besar dan cepat, namun hal tersebut tidak pasti, bahkan dapat menimbulkan kerugian yang besar dan cepat juga. Seperti produk keuangan lainnya, tidak ada yang dinamakan "pasti untung".',
            'Disebabkan adanya mekanisme leverage dan sifat dari transaksi Kontrak Derivatif Dalam Sistem Perdagangan Alternatif, Anda dapat merasakan dampak bahwa Anda menderita kerugian dalam waktu cepat. Keuntungan maupun kerugian dalam transaksi akan langsung dikredit atau didebet ke rekening Anda, paling lambat secara harian. Apabila pergerakan di pasar terhadap Kontrak Derivatif Dalam Sistem Perdagangan Alternatif menurunkan nilai posisi Anda dalam Kontrak Derivatif Dalam Sistem Perdagangan Alternatif, dengan kata lain berlawanan dengan posisi yang Anda ambil, Anda diwajibkan untuk menambah dana untuk pemenuhan kewajiban Margin ke perusahaan Pialang Berjangka. Apabila rekening Anda berada dibawah minimum Margin yang telah ditetapkan Lembaga Kliring Berjangka atau Pialang Berjangka, maka posisi Anda dapat dilikuidasi pada saat rugi, dan Anda wajib menyelesaikan defisit (jika ada) dalam rekening Anda.',
            'Pada saat pasar dalam keadaan tertentu, Anda mungkin akan sulit atau tidak mungkin melikuidasi posisi. Pada umumnya Anda harus melakukan transaksi mengambil posisi yang berlawanan dengan maksud melikuidasi posisi (offset) jika ingin melikuidasi posisi dalam Kontrak Derivatif dalam Sistem Perdagangan Alternatif. Apabila Anda tidak dapat melikuidasi posisi Kontrak Derivatif dalam Sistem Perdagangan Alternatif, Anda tidak dapat merealisasikan keuntungan pada nilai posisi tersebut atau mencegah kerugian yang lebih tinggi. Kemungkinan tidak dapat melikuidasi dapat terjadi, antara lain: jika perdagangan berhenti dikarenakan aktivitas perdagangan yang tidak lazim pada Kontrak Derivatif atau subjek Kontrak Derivatif, atau terjadi kerusakan sistem pada Pialang Berjangka Peserta Sistem Perdagangan Alternatif atau Pedagang Berjangka Penyelenggara Sistem Perdagangan Alternatif. Bahkan apabila Anda dapat melikuidasi posisi tersebut, Anda mungkin terpaksa melakukannya pada harga yang menimbulkan kerugian besar.',
            'Pada saat pasar dalam keadaan tertentu, Anda mungkin akan sulit atau tidak mungkin mengelola risiko atas posisi terbuka Kontrak Derivatif Dalam Sistem Perdagangan Alternatif dengan cara membuka posisi dengan nilai yang sama namun dengan posisi yang berlawanan dalam kontrak bulan yang berbeda, dalam pasar yang berbeda atau dalam “subjek Kontrak Derivatif Dalam Sistem Perdagangan Alternatif” yang berbeda. Kemungkinan untuk tidak dapat mengambil posisi dalam rangka membatasi risiko yang timbul, contohnya: jika perdagangan dihentikan pada pasar yang berbeda disebabkan aktivitas perdagangan yang tidak lazim pada Kontrak Derivatif Dalam Sistem Perdagangan Alternatif atau “Kontrak Derivatif Dalam Sistem Perdagangan Alternatif”.',
            'Anda dapat menderita kerugian yang disebabkan kegagalan sistem informasi. Sebagaimana yang terjadi pada setiap transaksi keuangan, Anda dapat menderita kerugian jika amanat untuk melaksanakan transaksi Kontrak Derivatif Dalam Sistem Perdagangan Alternatif tidak dapat dilakukan karena kegagalan sistem informasi di Bursa Berjangka, Pedagang Berjangka Penyelenggara Sistem Perdagangan Alternatif, maupun sistem di Pialang Berjangka Peserta Sistem Perdagangan Alternatif yang mengelola posisi Anda.. Kerugian Anda akan semakin besar jika Pialang Berjangka yang mengelola posisi Anda tidak memiliki sistem informasi cadangan atau prosedur yang layak.',
            'Semua Kontrak Derivatif Dalam Sistem Perdagangan Alternatif mempunyai risiko, dan tidak ada strategi berdagang yang dapat menjamin untuk menghilangkan risiko tersebut. Strategi dengan menggunakan kombinasi posisi seperti spread, dapat sama berisiko seperti posisi long atau short. Melakukan Perdagangan Berjangka memerlukan pengetahuan mengenai Kontrak Derivatif Dalam Sistem Perdagangan Alternatif dan pasar berjangka.',
            'Strategi perdagangan harian dalam Kontrak Derivatif Dalam Sistem Perdagangan Alternatif dan produk lainnya memiliki risiko khusus. Seperti pada produk keuangan lainnya, pihak yang ingin membeli atau menjual Kontrak Derivatif Dalam Sistem Perdagangan Alternatif yang sama dalam satu hari untuk mendapat keuntungan dari perubahan harga pada hari tersebut (“day traders”) akan memiliki beberapa risiko tertentu antara lain jumlah komisi yang besar, risiko terkena efek pengungkit (“exposure to leverage”), dan persaingan dengan pedagang profesional. Anda harus mengerti risiko tersebut dan memiliki pengalaman yang memadai sebelum melakukan perdagangan harian (“day trading”).',
            'Menetapkan amanat bersyarat, seperti Kontrak Derivatif Dalam Sistem Perdagangan Alternatif dilikuidasi pada keadaan tertentu untuk membatasi rugi (stop loss), mungkin tidak akan dapat membatasi kerugian Anda sampai jumlah tertentu saja. Amanat bersyarat tersebut mungkin tidak dapat dilaksanakan karena terjadi kondisi pasar yang tidak memungkinkan melikuidasi Kontrak Derivatif Dalam Sistem Perdagangan Alternatif.',
            'Anda harus membaca dengan seksama dan memahami Perjanjian Pemberian Amanat dengan Pialang Berjangka Anda sebelum melakukan transaksi Kontrak Derivatif Dalam Sistem Perdagangan Alternatif.',
            'Pernyataan singkat ini tidak dapat memuat secara rinci seluruh risiko atau aspek penting lainnya tentang Perdagangan Berjangka. Oleh karena itu Anda harus mempelajari kegiatan Perdagangan Berjangka secara cermat sebelum memutuskan melakukan transaksi.',
            'Dokumen Pemberitahuan Adanya Risiko (Risk Disclosure) ini dibuat dalam Bahasa Indonesia.'
          ],
        ),
        CustomText.underline(context, text: "PERNYATAAN MENERIMA PEMBERITAHUAN ADANYA RISIKO", bold: true),
        const SizedBox(height: 15),
        StatementWidget.pernyataanTelahMembaca(dynamicTitlePart: "DOKUMEN PEMBERITAHUAN ADANYA RISIKO"),
      ],
    );
  }
}