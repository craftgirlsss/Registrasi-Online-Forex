import 'package:flutter/material.dart';

class NumberedAgreementList extends StatelessWidget {
  final String title; // Optional title
  final String subtitle; // Optional subtitle
  final List<String> items; // List of agreement texts
  final String agreementText; // Text shown beside checkbox

  const NumberedAgreementList({
    super.key,
    this.title = '',
    this.subtitle = '',
    required this.items,
    this.agreementText = "Saya sudah membaca dan memahami *)",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Color(0xFF263351),
                ),
              ),
            ),

          // Subtitle
          if (subtitle.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
            ),

          // Numbered Agreement Items
          ...items.asMap().entries.map((entry) {
            final index = entry.key + 1;
            final text = entry.value;

            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Numbered text
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$index. ",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          text,
                          style: const TextStyle(
                            fontSize: 16.0,
                            height: 1.5,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8.0),

                  // Checkbox (always true)
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: null, // Non-interactive
                      ),
                      Expanded(
                        child: Text(
                          agreementText,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
