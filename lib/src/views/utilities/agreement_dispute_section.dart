import 'package:flutter/material.dart';

class AgreementDisputeSection extends StatefulWidget {
  const AgreementDisputeSection({super.key});

  @override
  State<AgreementDisputeSection> createState() =>
      _AgreementDisputeSectionState();
}

class _AgreementDisputeSectionState extends State<AgreementDisputeSection> {
  String? disputeResolution; // untuk a/b
  String? selectedOffice; // untuk kantor
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "23. ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Expanded(
              child: Text(
                "Penyelesaian Perselisihan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // (1)
        _buildNumberedText(
          "(1)",
          "Semua perselisihan dan perbedaan pendapat yang timbul dalam pelaksanaan Perjanjian ini wajib diselesaikan terlebih dahulu secara musyawarah untuk mencapai mufakat antara Para Pihak.",
        ),

        // (2)
        _buildNumberedText(
          "(2)",
          "Apabila perselisihan dan perbedaan pendapat yang timbul tidak dapat diselesaikan secara musyawarah untuk mencapai mufakat, Para Pihak wajib memanfaatkan sarana penyelesaian perselisihan yang tersedia di Bursa Berjangka.",
        ),

        // (3) dengan pilihan a, b
        _buildNumberedText(
          "(3)",
          "Apabila perselisihan dan perbedaan pendapat yang timbul tidak dapat diselesaikan melalui cara sebagaimana dimaksud pada angka (1) dan angka (2), maka Para Pihak sepakat untuk menyelesaikan perselisihan melalui *):",
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RadioListTile<String>(
                value: "a",
                groupValue: disputeResolution,
                onChanged: (value) {
                  setState(() => disputeResolution = value);
                },
                title: const Text(
                  "a. Badan Arbitrase Perdagangan Berjangka Komoditi (BAKTI) berdasarkan Peraturan dan Prosedur Badan Arbitrase Perdagangan Berjangka Komoditi (BAKTI); atau",
                  style: TextStyle(fontSize: 15, height: 1.4),
                ),
              ),
              RadioListTile<String>(
                value: "b",
                groupValue: disputeResolution,
                onChanged: (value) {
                  setState(() => disputeResolution = value);
                },
                title: const Text(
                  "b. Pengadilan Negeri Jakarta Selatan",
                  style: TextStyle(fontSize: 15, height: 1.4),
                ),
              ),
            ],
          ),
        ),

        // (4) dengan pilihan kantor
        _buildNumberedText(
          "(4)",
          "Kantor atau kantor cabang Pialang Berjangka terdekat dengan domisili Nasabah tempat penyelesaian dalam hal terjadi perselisihan. Kantor yang dipilih (salah satu) *):",
        ),
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 4, bottom: 4),
          child: Text("Daftar Kantor:",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Column(
            children: [
              RadioListTile<String>(
                value: "Jakarta Selatan",
                groupValue: selectedOffice,
                onChanged: (value) {
                  setState(() => selectedOffice = value);
                },
                title: const Text(
                  "JAKARTA SELATAN",
                  style: TextStyle(fontSize: 15, height: 1.4),
                ),
              ),
              // Tambahkan kantor lain kalau perlu
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Checkbox
        Row(
          children: [
            Checkbox(
              value: agreed,
              onChanged: (value) {
                setState(() => agreed = value ?? false);
              },
            ),
            const Expanded(
              child: Text(
                "Saya sudah membaca dan memahami *)",
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberedText(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 6, right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$number ",
              style: const TextStyle(fontSize: 15, height: 1.4)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, height: 1.4),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
