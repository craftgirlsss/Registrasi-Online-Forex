import 'package:flutter/material.dart';

class ProcessTable extends StatelessWidget {
  final List<Map<String, dynamic>> processes;

  const ProcessTable({super.key, required this.processes});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      columnWidths: const {
        0: FlexColumnWidth(0.11), // NO kecil
        1: FlexColumnWidth(0.7), // PROSES panjang
        2: FlexColumnWidth(0.2), // STATUS
      },
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Color(0xFFEFEFEF)),
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("NO", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("PROSES", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("STATUS", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        ...processes.map((process) {
          return TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(process["no"].toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(process["proses"]),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: process["status"]
                    ? const Icon(Icons.check, color: Colors.green)
                    : const SizedBox.shrink(),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}
