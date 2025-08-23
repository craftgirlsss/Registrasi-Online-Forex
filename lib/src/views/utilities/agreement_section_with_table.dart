import 'package:flutter/material.dart';

class AgreementSectionWithTable extends StatelessWidget {
  final int sectionNumber;
  final String title;
  final List<String> subItems;
  final Map<String, String>? details; // untuk key-value detail (Nama, Alamat, dsb)
  final List<Map<String, String>>? table; // untuk data table
  final bool showCheckbox;

  const AgreementSectionWithTable({
    super.key,
    required this.sectionNumber,
    required this.title,
    required this.subItems,
    this.details,
    this.table,
    this.showCheckbox = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$sectionNumber. ",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Sub Items
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: subItems.asMap().entries.map((entry) {
              final int subIndex = entry.key + 1;
              final String subText = entry.value;

              return Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "($subIndex) ",
                      style: const TextStyle(fontSize: 15),
                    ),
                    Expanded(
                      child: Text(
                        subText,
                        style: const TextStyle(fontSize: 15, height: 1.4),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

          // Detail Key-Value
          if (details != null && details!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: details!.entries.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Text("${e.key} : ",
                            style: const TextStyle(fontWeight: FontWeight.w500)),
                        Expanded(child: Text(e.value)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],

          // Table Section
          if (table != null && table!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Table(
              border: TableBorder.all(color: Colors.black26),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              children: [
                // Header
                const TableRow(
                  decoration: BoxDecoration(color: Color(0xFFEFEFEF)),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("NAME", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("CURRENCY", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("ACCOUNT", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                // Data Rows
                ...table!.map((row) {
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(row["name"] ?? ""),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(row["currency"] ?? ""),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(row["account"] ?? ""),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ],

          // Checkbox
          if (showCheckbox) ...[
            const SizedBox(height: 8),
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
        ],
      ),
    );
  }
}
