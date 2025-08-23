import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utilities {
  static Future<String> selectDate(BuildContext context, {DateTime? firstDate, DateTime? lastDate}) async {
    final now = DateTime.now();
    final minDate = DateTime(now.year - 65, 1, 1); // 1 Jan (65 tahun lalu)
    final maxDate = DateTime(now.year - 17, 12, 31); // 31 Des (17 tahun lalu)

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 17, now.month, now.day), // default umur termuda
      firstDate: firstDate ?? minDate,
      lastDate: lastDate ?? maxDate,
    );

    if (pickedDate != null) {
      return "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
    return '';
  }

  static Widget getImage({
    required BuildContext context,
    String? imageURL,
    double size = 120,
    Function(File)? onImageSelected,
  }) {
    return GestureDetector(
      onTap: () async {
        if (imageURL != null) return; // kalau sudah ada imageURL, jangan pilih lagi

        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (ctx) {
            return SafeArea(
              child: Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Gallery"),
                    onTap: () async {
                      Navigator.pop(ctx);
                      final picker = ImagePicker();
                      final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null && onImageSelected != null) {
                        onImageSelected(File(pickedFile.path));
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text("Camera"),
                    onTap: () async {
                      Navigator.pop(ctx);
                      final picker = ImagePicker();
                      final pickedFile =
                      await picker.pickImage(source: ImageSource.camera);
                      if (pickedFile != null && onImageSelected != null) {
                        onImageSelected(File(pickedFile.path));
                      }
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        width: size,
        height: size / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade200,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
          image: imageURL != null
              ? DecorationImage(
            image: NetworkImage(imageURL),
            fit: BoxFit.cover,
          )
              : null,
        ),
        child: imageURL == null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
            SizedBox(height: 8),
            Text(
              "Upload",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
            : null,
      ),
    );
  }
}

