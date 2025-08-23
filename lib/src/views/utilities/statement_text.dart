import 'package:flutter/material.dart';

class StatementWidget {
  static Container pernyataanTelahMembaca({String? dynamicTitlePart, String? title}){
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center align the column content
        children: [
          // Title
          title == null ? const SizedBox() : Text(
            'PERNYATAAN TELAH MEMBACA $dynamicTitlePart',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF263351), // Dark blue from previous designs
              fontSize: 18.0,
            ),
          ),
          title == null ? const SizedBox() : const SizedBox(height: 15.0), // Space between title and main text
          // Main statement text
          Text.rich(
            TextSpan(
              text: 'Dengan mengisi kolom "YA" di bawah, saya menyatakan bahwa saya telah membaca dan menerima informasi ',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black87,
                fontSize: 16.0,
                height: 1.5, // Line height for better readability
              ),
              children: [
                TextSpan(
                  text: '$dynamicTitlePart,', // Dynamic part, make it bold if needed
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // Make dynamic title bold in the statement
                  ),
                ),
                const TextSpan(
                  text: '\nmengerti dan memahami isinya.', // New line for "mengerti..."
                ),
              ],
            ),
            textAlign: TextAlign.center, // Center align the entire statement
          ),
        ],
      ),
    );
  }

  static Container pernyataanKebenaranDanTanggungJawab(){
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center align the column content
        children: [
          // Title
          Text(
            'PERNYATAAN KEBENARAN DAN TANGGUNG JAWAB',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF263351), // Dark blue from previous designs
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 15.0), // Space between title and main text
          // Main statement text
          Text.rich(
            TextSpan(
              text: 'Dengan mengisi kolom “YA” di bawah, saya menyatakan bahwa semua informasi dan semua dokumen yang saya lampirkan dalam ',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black87,
                fontSize: 16.0,
                height: 1.5, // Line height for better readability
              ),
              children: [
                TextSpan(
                  text: 'APLIKASI PEMBUKAAN REKENING TRANSAKSI SECARA ELEKTRONIK ONLINE ', // Dynamic part, make it bold if needed
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // Make dynamic title bold in the statement
                  ),
                ),
                const TextSpan(
                  text: 'adalah benar dan tepat, Saya akan bertanggung jawab penuh apabila dikemudian hari terjadi sesuatu hal sehubungan dengan ketidakbenaran data yang saya berikan', // New line for "mengerti..."
                ),
              ],
            ),
            textAlign: TextAlign.center, // Center align the entire statement
          ),
        ],
      ),
    );
  }

  static Container pernyataanTelahMelakukanSimulasi({String? dynamicTitlePart}){
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center align the column content
        children: [
          const SizedBox(height: 15.0), // Space between title and main text
          // Main statement text
          Text.rich(
            TextSpan(
              text: 'Dengan mengisi kolom "YA" di bawah, saya menyatakan bahwa saya telah melakukan simulasi bertransaksi di bidang Perdagangan di bidang kontrak derivatif sistem perdagangan alternatif pada ',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black87,
                fontSize: 16.0,
                height: 1.5, // Line height for better readability
              ),
              children: [
                TextSpan(
                  text: '$dynamicTitlePart,', // Dynamic part, make it bold if needed
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // Make dynamic title bold in the statement
                  ),
                ),
                const TextSpan(
                  text: ' dan telah memahami tentang tata cara bertransaksi di bidang Perdagangan di bidang kontrak derivatif sistem perdagangan alternatif .', // New line for "mengerti..."
                ),
              ],
            ),
            textAlign: TextAlign.center, // Center align the entire statement
          ),
          const SizedBox(height: 20),
          Text("Demikian Pernyataan ini dibuat dengan sebenarnya dalam keadaan sadar, sehat jasmani dan rohani serta tanpa paksaan apapun dari pihak manapun.", textAlign: TextAlign.center, style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black87,
            fontSize: 16.0,
            height: 1.5, // Line height for better readability
          ),)
        ],
      ),
    );
  }

  static Widget paraPihak() {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
        ),
        children: [
          TextSpan(
              text:
              "Nasabah dan Pialang Berjangka secara bersama - sama selanjutnya di sebut "),
          TextSpan(
            text: "Para Pihak.",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  static Widget kodeAkses() {
    return RichText(
      textAlign: TextAlign.justify,
      text: const TextSpan(
        style: TextStyle(
          fontSize: 15,
          color: Colors.black54,
        ),
        children: [
          TextSpan(text: "Dengan mengisi kolom “YA” di bawah, saya menyatakan bahwa saya bertanggungjawab sepenuhnya terhadap kode akses transaksi Nasabah "),
          TextSpan(
            text: "(Personal Access Password) ",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          TextSpan(text: "dan tidak menyerahkan kode akses transaksi Nasabah "),
          TextSpan(
            text: "(Personal Access Password) ",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          TextSpan(text: "ke pihak lain, terutama kepada pegawai Pialang Berjangka atau pihak yang memiliki kepentingan dengan Pialang Berjangka."),
        ],
      ),
    );
  }

  static Widget danaPribadi() {
    return RichText(
      textAlign: TextAlign.justify,
      text: const TextSpan(
        style: TextStyle(
          fontSize: 15,
          color: Colors.black54,
        ),
        children: [
          TextSpan(text: "Dengan di bawah "),
          TextSpan(
            text: "mengisi kolom “YA” di bawah ",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          TextSpan(text: "bersama ini saya menyatakan bahwa dana yang saya gunakan untuk bertransaksi di PT. VIG Group Futures adalah milik saya pribadi dan bukan dana pihak lain, serta tidak diperoleh dari hasil kejahatan, penipuan, penggelapan, tindak pidana korupsi, tindak pidana narkotika, tindak pidana di bidang kehutanan, hasil pencucian uang, dan perbuatan melawan hukum lainnya serta tidak dimaksudkan untuk melakukan pencucian uang dan/atau pendanaan terorisme."),
        ],
      ),
    );
  }
}