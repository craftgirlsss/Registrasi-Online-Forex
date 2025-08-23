import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/texts/texts.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/views/utilities/agreement_dispute_section.dart';
import 'package:forex_regol/src/views/utilities/agreement_section_list.dart';
import 'package:forex_regol/src/views/utilities/agreement_section_with_table.dart';
import 'package:forex_regol/src/views/utilities/numbered_text_list.dart';
import 'package:forex_regol/src/views/utilities/statement_text.dart';
import 'package:forex_regol/src/views/utilities/today_statement.dart';
import 'package:get/get.dart';
import 'halaman_delapan_formulir_risiko.dart';
import 'halaman_sebelas_pernyatan_bertanggung_jawab.dart';

class HalamanSembilanPerjanjianPemberianAmanat extends StatefulWidget {
  const HalamanSembilanPerjanjianPemberianAmanat({super.key});

  @override
  State<HalamanSembilanPerjanjianPemberianAmanat> createState() => _HalamanSembilanPerjanjianPemberianAmanatState();
}

class _HalamanSembilanPerjanjianPemberianAmanatState extends State<HalamanSembilanPerjanjianPemberianAmanat> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      withBottomMenu: true,
      title: "",
      onPressed: (){
        Get.to(() => const HalamanSebelasPernyataanBertanggungJawab());
      },
      children: [
        CustomText.titleHeadingPage(context, text: "PERJANJIAN PEMBERIAN AMANAT SECARA ELEKTRONIK ONLINE UNTUK TRANSAKSI KONTRAK DERIVATIF DALAM SISTEM PERDAGANGAN ALTERNATIF"),
        const SizedBox(height: 15),
        CustomText.titleHeadingPage(context, text: "PERHATIAN !"),
        CustomText.normal(context, text: "PERJANJIAN INI MERUPAKAN KONTRAK HUKUM. HARAP DIBACA DENGAN SEKSAMA !"),
        TodayStatement(
          name1: "Kholid Hikam",
          job1: "Swasta / Staf",
          address1: "Tuban",
          name2: "Vilma Villameva",
          job2: "Wakil Pialang Berjangka",
          address2: "Menara Prima Lt.5 unit I & J, Jl. Dr. Ide Anak Agung Gde Agung Blok 6.2 Kuningan Timur, Jakarta Selatan 12950",
          companyName: "VIG Group Futures",
        ),
        StatementWidget.paraPihak(),
        const SizedBox(height: 15.0),
        CustomText.normal(context, text: "Para Pihak sepakat untuk mengadakan Perjanjian Pemberian Amanat untuk melakukan transaksi penjualan maupun pembelian Kontrak Derivatif Dalam Sistem Perdagangan Alternatif dengan ketentuan sebagai berikut :", align: TextAlign.justify),
        const SizedBox(height: 15.0),
        AgreementSectionList(
          sections: {
            "Margin dan Pembayaran Lainnya": [
              "Nasabah menempatkan sejumlah dana (Margin) ke Rekening Terpisah (Segregated Account) Pialang Berjangka sebagai Margin Awal dan wajib mempertahankannya sebagaimana ditetapkan.",
              "Membayar biaya-biaya yang diperlukan untuk transaksi, yaitu biaya transaksi, pajak, komisi, dan biaya pelayanan, biaya bunga sesuai tingkat yang berlaku, dan biaya lainnya yang dapat dipertanggungjawabkan berkaitan dengan transaksi sesuai amanat Nasabah, maupun biaya rekening Nasabah.",
            ],
            "Pelaksanaan Transaksi": [
              "Setiap transaksi Nasabah dilaksanakan secara elektronik online oleh Nasabah yang bersangkutan;",
              "Setiap amanat Nasabah yang diterima dapat langsung dilaksanakan sepanjang nilai Margin yang tersedia pada rekeningnya mencukupi dan eksekusinya dapat menimbulkan perbedaan waktu terhadap proses pelaksanaan transaksi tersebut. Nasabah harus mengetahui posisi Margin dan posisi terbuka sebelum memberikan amanat untuk transaksi berikutnya.",
              "Setiap transaksi Nasabah secara bilateral dilawankan dengan Penyelenggara Sistem Perdagangan Alternatif PT World Index Investment (WII) yang bekerjasama dengan Pialang Berjangka.",
              "Nasabah bertanggung jawab atas keamanan dan penggunaan username dan password dalam transaksi Perdagangan Berjangka, Nasabah dilarang memberitahukan, menyerahkan atau meminjamkan username dan password kepada pihak lain, termasuk kepada pegawai Pialang Berjangka.",
            ],
            "Kewajiban Memelihara Margin": [
              "Nasabah wajib memelihara/memenuhi tingkat Margin yang harus tersedia di rekening pada Pialang Berjangka sesuai dengan jumlah yang telah ditetapkan baik diminta ataupun tidak oleh Pialang Berjangka.",
              "Apabila jumlah Margin memerlukan penambahan maka Pialang Berjangka wajib memberitahukan dan memintakan kepada Nasabah untuk menambah Margin segera.",
              "Apabila jumlah Margin memerlukan tambahan (Call Margin) maka Nasabah wajib melakukan penyerahan Call Margin selambat-lambatnya sebelum dimulai hari perdagangan berikutnya. Kewajiban Nasabah sehubungan dengan penyerahan Call Margin tidak terbatas pada jumlah Margin awal.",
              "Pialang Berjangka tidak berkewajiban melaksanakan amanat untuk melakukan transaksi yang baru dari Nasabah sebelum Call Margin dipenuhi.",
              "Untuk memenuhi kewajiban Call Margin dan keuangan lainnya dari Nasabah, Pialang Berjangka dapat mencairkan dana Nasabah yang ada di Pialang Berjangka."
            ],
            "Hak Pialang Berjangka Melikuidasi Posisi Nasabah": [
              "Nasabah bertanggung jawab memantau/mengetahui posisi terbukanya secara terus- menerus dan memenuhi kewajibannya. Apabila dalam jangka waktu tertentu dana pada rekening Nasabah kurang dari yang dipersyaratkan, Pialang Berjangka dapat menutup posisi terbuka Nasabah secara keseluruhan atau sebagian, membatasi transaksi, atau tindakan lain untuk melindungi diri dalam pemenuhan Margin tersebut dengan terlebih dahulu memberitahu atau tanpa memberitahu Nasabah dan Pialang Berjangka tidak bertanggung jawab atas kerugian yang timbul akibat tindakan tersebut."
            ],
            "Penggantian Kerugian Tidak Adanya Penutupan Posisi": [
              "Apabila Nasabah tidak mampu melakukan penutupan atas transaksi yang jatuh tempo, Pialang Berjangka dapat melakukan penutupan atas transaksi Nasabah yang terjadi. Nasabah wajib membayar biaya-biaya, termasuk biaya kerugian dan premi yang telah dibayarkan oleh Pialang Berjangka, dan apabila Nasabah lalai untuk membayar biaya-biaya tersebut, Pialang Berjangka berhak untuk mengambil pembayaran dari dana Nasabah."
            ],
            "Pialang Berjangka Dapat Membatasi Posisi": [
              "Nasabah mengakui hak Pialang Berjangka untuk membatasi posisi terbuka Kontrak dan Nasabah tidak melakukan transaksi melebihi batas yang telah ditetapkan tersebut."
            ],
            "Tidak Ada Jaminan atas Informasi atau Rekomendasi": [
              "Informasi dan rekomendasi yang diberikan oleh Pialang Berjangka kepada Nasabah tidak selalu lengkap dan perlu diverifikasi.",
              "Pialang Berjangka tidak menjamin bahwa informasi dan rekomendasi yang diberikan merupakan informasi yang akurat dan lengkap.",
              "Informasi dan rekomendasi yang diberikan oleh Wakil Pialang Berjangka yang satu dengan yang lain mungkin berbeda karena perbedaan analisis fundamental atau teknikal. Nasabah menyadari bahwa ada kemungkinan Pialang Berjangka dan pihak terafiliasinya memiliki posisi di pasar dan memberikan rekomendasi tidak konsisten kepada Nasabah."
            ],
            "Pembatasan Tanggung Jawab Pialang Berjangka.": [
              "Pialang Berjangka tidak bertanggung jawab untuk memberikan penilaian kepada Nasabah mengenai iklim, pasar, keadaan politik dan ekonomi nasional dan internasional, nilai Kontrak Derivatif, kolateral, atau memberikan nasihat mengenai keadaan pasar. Pialang Berjangka hanya memberikan pelayanan untuk melakukan transaksi secara jujur serta memberikan laporan atas transaksi tersebut.",
              "Perdagangan sewaktu-waktu dapat dihentikan oleh pihak yang memiliki otoritas (Bappebti/Bursa Berjangka) tanpa pemberitahuan terlebih dahulu kepada Nasabah. Atas posisi terbuka yang masih dimiliki oleh Nasabah pada saat perdagangan tersebut dihentikan, maka akan diselesaikan (likuidasi) berdasarkan pada peraturan/ketentuan yang dikeluarkan dan ditetapkan oleh pihak otoritas tersebut, dan semua kerugian serta biaya yang timbul sebagai akibat dihentikannya transaksi oleh pihak otoritas perdagangan tersebut, menjadi beban dan tanggung jawab Nasabah sepenuhnya.",
            ],
            "Transaksi Harus Mematuhi Peraturan Yang Berlaku": [
              "Semua transaksi dilakukan sendiri oleh Nasabah dan wajib mematuhi peraturan perundang-undangan di bidang Perdagangan Berjangka, kebiasaan dan interpretasi resmi yang ditetapkan oleh Bappebti atau Bursa Berjangka.",
            ],
            "Pialang Berjangka tidak Bertanggung jawab atas Kegagalan Komunikasi": [
              "Pialang Berjangka tidak bertanggung jawab atas keterlambatan Kegagalan Komunikasi Pialang Berjangka tidak bertanggung jawab atas keterlambatan atau tidak tepat waktunya pengiriman amanat atau informasi lainnya yang disebabkan oleh kerusakan fasilitas komunikasi atau sebab lain diluar kontrol Pialang Berjangka.",
            ],
            "Konfirmasi": [
              "Konfirmasi dari Nasabah dapat berupa surat, telex, media lain, surat elektronik, secara tertulis ataupun rekaman suara.",
              "Pialang Berjangka berkewajiban menyampaikan konfirmasi transaksi, laporan rekening, permintaan Call Margin, dan pemberitahuan lainnya kepada Nasabah secara akurat, benar dan secepatnya pada alamat (email) Nasabah sesuai dengan yang tertera dalam rekening Nasabah. Apabila dalam jangka waktu 2 x 24 jam setelah amanat jual atau beli disampaikan, tetapi Nasabah belum menerima konfirmasi melalui alamat email Nasabah dan/atau sistem transaksi, Nasabah segera memberitahukan hal tersebut kepada Pialang Berjangka melalui telepon dan disusul dengan pemberitahuan tertulis.",
              "Jika dalam waktu 2 x 24 jam sejak tanggal penerimaan konfirmasi tersebut tidak ada sanggahan dari Nasabah maka konfirmasi Pialang Berjangka dianggap benar dan sah.",
              "Kekeliruan atas konfirmasi yang diterbitkan Pialang Berjangka akan diperbaiki oleh Pialang Berjangka sesuai keadaan yang sebenarnya dan demi hukum konfirmasi yang lama batal.",
              "Nasabah tidak bertanggung jawab atas transaksi yang dilaksanakan atas rekeningnya apabila konfirmasi tersebut tidak disampaikan secara benar dan akurat."
            ],
            "Kebenaran Informasi Nasabah": [
              "Nasabah memberikan informasi yang benar dan akurat mengenai data Nasabah yang diminta oleh Pialang Berjangka dan akan memberitahukan paling lambat dalam waktu 3 (tiga) hari kerja setelah terjadi perubahan, termasuk perubahan kemampuan keuangannya untuk terus melaksanakan transaksi.",
            ],
            "Komisi Transaksi": [
              "Nasabah mengetahui dan menyetujui bahwa Pialang Berjangka berhak untuk memungut komisi atas transaksi yang telah dilaksanakan, dalam jumlah sebagaimana akan ditetapkan dari waktu ke waktu oleh Pialang Berjangka. Perubahan beban (fees) dan biaya lainnya harus disetujui secara tertulis oleh Para Pihak.",
            ],
            "Pemberian Kuasa": [
              """Nasabah memberikan kuasa kepada Pialang Berjangka untuk menghubungi bank, lembaga keuangan, Pialang Berjangka lain, atau institusi lain yang terkait untuk memperoleh keterangan atau verifikasi mengenai informasi yang diterima dari Nasabah. Nasabah mengerti bahwa penelitian mengenai data hutang pribadi dan bisnis dapat dilakukan oleh Pialang Berjangka apabila diperlukan. Nasabah diberikan kesempatan untuk memberitahukan secara tertulis dalam jangka waktu yang telah disepakati untuk melengkapi persyaratan yang diperlukan.
Nasabah dapat juga memberikan kuasa kepada pihak lain (bukan Pengurus Pialang Berjangka, bukan Wakil Pialang Berjangka yang menanda-tangani perjanjian ini dan bukan pegawai Pialang Berjangka yang jabatannya satu tingkat di bawah Direksi) yang ditunjuk oleh Nasabah untuk menjalankan hak-hak yang timbul atas rekening, termasuk memberikan instruksi kepada Pialang Berjangka atas rekening yang dimiliki Nasabah, berdasarkan surat kuasa dalam bentuk dan isi yang tidak bertentangan dengan ketentuan Peraturan Perundang-undangan.""",
            ],
            "Pemindahan Dana": [
              "Pialang Berjangka dapat setiap saat mengalihkan dana dari satu rekening ke rekening lainnya berkaitan dengan kegiatan transaksi yang dilakukan Nasabah seperti pembayaran komisi, pembayaran biaya transaksi, kliring dan keterlambatan dalam memenuhi kewajibannya, tanpa terlebih dahulu memberitahukan kepada Nasabah. Transfer yang telah dilakukan akan segera diberitahukan secara tertulis kepada Nasabah",
            ],
            "Dokumen Pemberitahuan Adanya Risiko": [
              "Nasabah mengakui menerima dan mengerti Dokumen Pemberitahuan Adanya Risiko.",
            ],
            "Jangka Waktu Perjanjian dan Pengakhiran": [
              "Perjanjian ini mulai berlaku terhitung sejak tanggal dilakukannya konfirmasi oleh Pialang Berjangka dengan diterimanya Bukti Konfirmasi Penerimaan Nasabah dari Pialang Berjangka oleh Nasabah.",
              "Nasabah dapat mengakhiri Perjanjian ini hanya jika Nasabah sudah tidak lagi memiliki posisi terbuka dan tidak ada kewajiban Nasabah yang diemban oleh atau terhutang kepada Pialang Berjangka.",
              "Pengakhiran tidak membebaskan salah satu Pihak dari tanggung jawab atau kewajiban yang terjadi sebelum pemberitahuan tersebut."
            ],
            "Berakhirnya Perjanjian": [
              "Dinyatakan pailit, memiliki hutang yang sangat besar, dalam proses peradilan, menjadi hilang ingatan, mengundurkan diri atau meninggal;",
              "Tidak dapat memenuhi atau mematuhi perjanjian ini dan/atau melakukan pelanggaran terhadapnya.",
              {
                "Berkaitan dengan butir (1) dan (2) tersebut diatas, Pialang Berjangka dapat:": [
                  "Meneruskan atau menutup posisi Nasabah tersebut setelah mempertimbangkannya secara cermat dan jujur",
                  "Menolak transaksi dari Nasabah."
                ]
              },
              "Pengakhiran Perjanjian sebagaimana dimaksud dengan angka (1) dan (2) tersebut di atas tidak melepaskan kewajiban dari Para Pihak yang berhubungan dengan penerimaan atau kewajiban pembayaran atau pertanggungjawaban kewajiban lainnya yang timbul dari Perjanjian."
            ],
            "Force Majeur": [
              """Tidak ada satupun pihak di dalam Perjanjian dapat diminta pertanggungjawabannya untuk suatu keterlambatan atau terhalangnya memenuhi kewajiban berdasarkan Perjanjian yang diakibatkan oleh suatu sebab yang berada di luar kemampuannya atau kekuasaannya (force majeur), sepanjang pemberitahuan tertulis mengenai sebab itu disampaikannya kepada pihak lain dalam Perjanjian dalam waktu tidak lebih dari 24 (dua puluh empat) jam sejak timbulnya sebab itu.
Yang dimaksud dengan Force Majeur dalam Perjanjian adalah peristiwa kebakaran, bencana alam (seperti gempa bumi, banjir, angin topan, petir), pemogokan umum, huru hara, peperangan, perubahan terhadap peraturan perundang-undangan yang berlaku dan kondisi di bidang ekonomi, keuangan dan Perdagangan Berjangka, pembatasan yang dilakukan oleh otoritas Perdagangan Berjangka dan Bursa Berjangka serta terganggunya sistem perdagangan, kliring dan penyelesaian transaksi Kontrak Berjangka di mana transaksi dilaksanakan yang secara langsung mempengaruhi pelaksanaan pekerjaan berdasarkan Perjanjian.""",
            ],
            "Perubahan atas Isian dalam Perjanjian Pemberian Amanat": [
              "Perubahan atas isian dalam Perjanjian ini hanya dapat dilakukan atas persetujuan Para Pihak, atau Pialang Berjangka telah memberitahukan secara tertulis perubahan yang diinginkan, dan Nasabah tetap memberikan perintah untuk transaksi dengan tanpa memberikan tanggapan secara tertulis atas usul perubahan tersebut. Tindakan Nasabah tersebut dianggap setuju atas usul perubahan tersebut.",
            ],
            "Tanggung Jawab Kepada Nasabah": [
              "Penyelenggara Sistem Perdagangan Alternatif yang merupakan pihak yang menguasai dan/atau memiliki sistem perdagangan elektronik bertanggung jawab atas pelanggaran penyalahgunaan sistem perdagangan elektronik sesuai dengan ketentuan yang diatur dalam Perjanjian Kerjasama (PKS) dan peraturan perdagangan (trading rules) antara Penyelenggara Sistem Perdagangan Alternatif dan Peserta Sistem Perdagangan Alternatif yang mengakibatkan kerugian Nasabah.",
              "Peserta Sistem Perdagangan Alternatif yang merupakan pihak yang menggunakan sistem perdagangan elektronik bertanggung jawab atas pelanggaran penyalahgunaan sistem perdagangan elektronik sebagaimana dimaksud pada angka 22 huruf (a) yang mengakibatkan kerugian Nasabah.",
              "Dalam pemanfaatan sistem perdagangan elektronik, Penyelenggara Sistem Perdagangan Alternatif dan/atau Peserta Sistem Perdagangan Alternatif tidak bertanggung jawab atas kerugian Nasabah diluar hal-hal yang telah diatur pada angka 22 huruf (a) dan (b), antara lain: kerugian yang diakibatkan oleh risiko-risiko yang di sebutkan di dalam Dokumen Pemberitahuan Adanya Risiko yang telah dimengerti dan disetujui oleh Nasabah."
            ],
            "Bahasa": [
              "Perjanjian ini dibuat dalam Bahasa Indonesia.",
            ],
          },
        ),
        AgreementDisputeSection(),
        AgreementSectionWithTable(
          sectionNumber: 24,
          title: "Pemberitahuan",
          subItems: [
            "Semua komunikasi, uang, surat berharga, dan kekayaan lainnya harus dikirimkan ...",
            "Semua uang, harus disetor atau ditransfer langsung oleh Nasabah ke Rekening Terpisah (Segregated Account) Pialang Berjangka:",
          ],
          details: {
            "Nama": "PT. VIG Group Futures",
            "Alamat": "Menara Prima Lt.5 unit I & J ... Jakarta selatan 12950",
          },
          table: [
            {"name": "Bank BCA KCU Chase Plaza Sudirman", "currency": "IDR", "account": "035-328-9991"},
            {"name": "Bank BCA KCU Chase Plaza Sudirman", "currency": "USD", "account": "035-329-9902"},
          ],
        ),
        CustomText.normal(context, text: "SECARA DETAIL BACA SELURUH DOKUMEN TRADING RULES DAN DISCLOSURE STATEMENT"),
        const SizedBox(height: 15),
        CustomText.normal(context, text: "Demikian Pernyataan ini dibuat dengan sebenarnya dalam keadaan sadar, sehat jasmani dan rohani serta tanpa paksaan apapun dari pihak manapun."),
      ],
    );
  }
}