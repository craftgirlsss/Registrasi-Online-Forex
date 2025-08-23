import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayStatement extends StatelessWidget {
  final String name1;
  final String job1;
  final String address1;

  final String name2;
  final String job2;
  final String address2;

  final String companyName;

  const TodayStatement({
    super.key,
    required this.name1,
    required this.job1,
    required this.address1,
    required this.name2,
    required this.job2,
    required this.address2,
    required this.companyName,
  });

  @override
  Widget build(BuildContext context) {
    // Ambil tanggal sekarang
    DateTime now = DateTime.now();
    String day = DateFormat.EEEE('id_ID').format(now);   // Sabtu
    String date = DateFormat.d('id_ID').format(now);     // 23
    String month = DateFormat.MMMM('id_ID').format(now); // Agustus
    String year = DateFormat.y('id_ID').format(now);     // 2025

    TextStyle bold = const TextStyle(fontWeight: FontWeight.bold);
    TextStyle normal = const TextStyle(color: Colors.black87, fontSize: 15);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pembuka
          RichText(
            text: TextSpan(
              style: normal,
              children: [
                const TextSpan(text: "Pada hari ini "),
                TextSpan(text: day, style: bold),
                const TextSpan(text: ", tanggal "),
                TextSpan(text: date, style: bold),
                const TextSpan(text: ", bulan "),
                TextSpan(text: month, style: bold),
                const TextSpan(text: ", tahun "),
                TextSpan(text: year, style: bold),
                const TextSpan(text: ", kami yang mengisi perjanjian di bawah ini:"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Pihak Pertama
          _buildPersonSection(
            index: 1,
            name: name1,
            job: job1,
            address: address1,
            footer: "dalam hal ini bertindak untuk dan atas nama sendiri, yang selanjutnya di sebut Nasabah,",
          ),

          const SizedBox(height: 20),

          // Pihak Kedua
          _buildPersonSection(
            index: 2,
            name: name2,
            job: job2,
            address: address2,
            footerRich: TextSpan(
              style: normal,
              children: [
                const TextSpan(text: "dalam hal ini bertindak untuk dan atas nama "),
                TextSpan(text: companyName, style: bold),
                const TextSpan(text: " yang selanjutnya di sebut "),
                TextSpan(text: "Pialang Berjangka,", style: bold),
              ],
            ),
            footer: '',
          ),
        ],
      ),
    );
  }

  Widget _buildPersonSection({
    required int index,
    required String name,
    required String job,
    required String address,
    required String footer,
    TextSpan? footerRich,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$index.", style: const TextStyle(fontSize: 15)),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRow("Nama", name),
              _buildRow("Pekerjaan / Jabatan", job),
              _buildRow("Alamat", address),
              const SizedBox(height: 10),
              footerRich != null
                  ? RichText(text: footerRich)
                  : Text(footer, style: const TextStyle(color: Colors.black87, fontSize: 15)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 120, child: Text(label, style: const TextStyle(fontSize: 15))),
          Expanded(
            child: Text(" : $value", style: const TextStyle(fontSize: 15)),
          ),
        ],
      ),
    );
  }
}
