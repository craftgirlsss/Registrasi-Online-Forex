import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'halaman_satu_profil_perusahaan.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🎬 Animasi sukses (Lottie)
              Icon(Icons.checklist_rounded, size: 80, color: Colors.green),

              const SizedBox(height: 20),

              // 🎉 Judul sukses
              const Text(
                "Registrasi Berhasil!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              // 📝 Deskripsi
              const Text(
                "Terima kasih telah mendaftar.\nAkun Anda sudah berhasil dibuat dan siap digunakan.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // 🔘 Tombol Lanjutkan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Get.offAll(() => HalamanSatuProfilPerusahaan());
                  },
                  child: const Text(
                    "Lanjutkan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
