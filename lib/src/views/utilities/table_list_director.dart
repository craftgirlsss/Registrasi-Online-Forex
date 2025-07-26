import 'package:flutter/material.dart';

class TableListDirector extends StatelessWidget {
  final String title; // Add a title parameter
  final Map<String, String> data; // Key-value map for dynamic rows
  final bool? removeTitle;

  const TableListDirector({
    super.key,
    required this.title, // Make title required
    required this.data,
    this.removeTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title "Dewan Direksi"
          removeTitle == null ? Align(
            alignment: Alignment.center, // Center the title
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0), // Space below the title
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ) : const SizedBox(),
          // Dynamically generated rows with numbering
          ...data.entries.map((entry) {
            final int index = data.keys.toList().indexOf(entry.key) + 1; // Get 1-based index
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Numbering (e.g., "1.") and Key (e.g., "Direktur Utama")
                  Expanded(
                    flex: 4, // Adjust flex to control width ratio for number + key
                    child: Text(
                      '$index. ${entry.key}', // Prepend number and dot
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, // Make key bold as in image
                        color: Color(0xFF263351), // Dark blue from the image
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0), // Spacer between key and value
                  // Value (e.g., ": Fachrul Zain")
                  Expanded(
                    flex: 4, // Adjust flex to control width ratio for value
                    child: Text(
                      ': ${entry.value}', // Prepend colon and space
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF263351), // Dark blue from the image
                        fontSize: 16.0,
                      ),
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