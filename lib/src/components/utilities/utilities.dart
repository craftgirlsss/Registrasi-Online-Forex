import 'package:flutter/material.dart';

class Utilities {
  static Future<String> selectDate(BuildContext context, {DateTime? firstDate, DateTime? lastDate}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: lastDate ?? DateTime.now(),
    );

    if (pickedDate != null) {
      // Format the date as dd/MM/yyyy or as desired
      return "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
    return '';
  }
}