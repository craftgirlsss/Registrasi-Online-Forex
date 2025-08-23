import 'package:flutter/material.dart';

class AgreementSectionList extends StatelessWidget {
  final Map<String, List<dynamic>> sections;

  const AgreementSectionList({
    super.key,
    required this.sections,
  });

  String _toRoman(int number) {
    switch (number) {
      case 1:
        return "i)";
      case 2:
        return "ii)";
      case 3:
        return "iii)";
      case 4:
        return "iv)";
      case 5:
        return "v)";
      default:
        return "$number)";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections.entries.map((entry) {
        final int sectionIndex = sections.keys.toList().indexOf(entry.key) + 1;
        final String sectionTitle = entry.key;
        final List<dynamic> subItems = entry.value;

        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Number + Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$sectionIndex. ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      sectionTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Sub Items
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: subItems.asMap().entries.map((subEntry) {
                  final int subIndex = subEntry.key + 1;
                  final dynamic subContent = subEntry.value;

                  // Jika subContent String biasa
                  if (subContent is String) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "($subIndex) ",
                            style: const TextStyle(fontSize: 15),
                          ),
                          Expanded(
                            child: Text(
                              subContent,
                              style: const TextStyle(
                                fontSize: 15,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  // Jika subContent Map => nested roman items
                  else if (subContent is Map<String, List<String>>) {
                    final String nestedTitle = subContent.keys.first;
                    final List<String> nestedItems = subContent.values.first;

                    return Padding(
                      padding: const EdgeInsets.only(left: 16, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "($subIndex) $nestedTitle",
                            style: const TextStyle(
                              fontSize: 15,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            nestedItems.asMap().entries.map((nestedEntry) {
                              final int romanIndex = nestedEntry.key + 1;
                              final String nestedText = nestedEntry.value;

                              return Padding(
                                padding:
                                const EdgeInsets.only(left: 17, bottom: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${_toRoman(romanIndex)} ",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    Expanded(
                                      child: Text(
                                        nestedText,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          height: 1.4,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                }).toList(),
              ),

              const SizedBox(height: 8),

              // Checkbox default true
              Row(
                children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  const Text(
                    "Saya sudah membaca dan memahami *)",
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
