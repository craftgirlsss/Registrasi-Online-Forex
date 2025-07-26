import 'package:flutter/material.dart';

class StatementTextWidget extends StatelessWidget {
  final String dynamicTitlePart; // Part of the title that can change

  const StatementTextWidget({
    super.key,
    required this.dynamicTitlePart, // This part is required
  });

  @override
  Widget build(BuildContext context) {
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
}