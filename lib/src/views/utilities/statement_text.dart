import 'package:flutter/material.dart';

class StatementWidget {
  static Container pernyataanTelahMembaca({String? dynamicTitlePart}){
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center align the column content
        children: [
          // Title
          Text(
            'PERNYATAAN TELAH MEMBACA $dynamicTitlePart',
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
}