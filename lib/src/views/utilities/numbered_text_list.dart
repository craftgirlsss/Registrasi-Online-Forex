import 'package:flutter/material.dart';

class NumberedTextList extends StatelessWidget {
  final String title; // Optional title for the list
  final String subtitle; // Optional subtitle/introductory text
  final List<String> items; // List of strings for the numbered items

  const NumberedTextList({
    super.key,
    this.title = '', // Default to empty string if no title is provided
    this.subtitle = '', // Default to empty string if no subtitle is provided
    required this.items, // List of items is required
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Optional Title
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF263351), // Dark blue
                  fontSize: 18.0,
                ),
              ),
            ),
          // Optional Subtitle/Introductory text
          if (subtitle.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                  fontSize: 16.0,
                ),
              ),
            ),
          // Numbered List Items
          ...items.asMap().entries.map((entry) {
            final int index = entry.key + 1; // 1-based index
            final String text = entry.value;

            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0), // Spacing between list items
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to top if it wraps
                children: [
                  Text(
                    '$index. ', // The number and dot
                    style: const TextStyle(
                      fontWeight: FontWeight.normal, // Numbers can be normal or bold based on preference
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                        fontSize: 16.0,
                        height: 1.5, // Line height for better readability of wrapped text
                      ),
                      textAlign: TextAlign.justify, // Justify text for clean block
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}