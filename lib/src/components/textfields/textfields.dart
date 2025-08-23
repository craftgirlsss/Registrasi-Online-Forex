import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyTextInputFormatter extends TextInputFormatter {
  final String currency;
  CurrencyTextInputFormatter({this.currency = 'IDR'});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      // kalau kosong, cursor balik ke awal (offset=0)
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Ambil angka mentah (hanya digit)
    String digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digits.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Format angka
    final formatter = NumberFormat.currency(
      locale: currency == "USD" ? "en_US" : "id_ID",
      symbol: "$currency ",
      decimalDigits: 0,
    );

    final newString = formatter.format(int.parse(digits));

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}

class CustomTextFields {
   // Helper method to build a common editable text field
  static Widget buildEditableTextField(
      BuildContext context, {
        required String label,
        required TextEditingController controller,
        bool? readOnly,
        TextInputType keyboardType = TextInputType.text,
        int? maxLines = 1,
        int? maxLength,
      }) {
    return Bounce(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.black12, width: 0.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1.0,
                  blurRadius: 5.0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextFormField(
              controller: controller,
              readOnly: readOnly ?? false,
              keyboardType: keyboardType,
              maxLines: maxLines,
              maxLength: maxLength,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              decoration: InputDecoration(
                hintText: "Ketik ${label} disini",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 0.2), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 0.2), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                counterText: "", // Hide character counter for maxLength
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for the date picker text field
  static Widget buildDatePickerField(
      BuildContext context, {
        required String label,
        required TextEditingController controller,
        required VoidCallback onTap,
      }) {
    return Bounce(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.black12, width: 0.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              readOnly: true, // Make it read-only so keyboard doesn't pop up
              onTap: onTap, // Call the date picker function on tap
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Atur ${label} disini",
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 0.2), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 0.2), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                suffixIcon: Icon(Icons.calendar_today, color: Colors.grey), // Calendar icon
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a styled read-only text field (from previous example)
  static Widget buildReadOnlyField(
      BuildContext context, {
        required String label,
        required String value,
      }) {
    return Bounce(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // Different background for read-only
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12, width: 0.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildCurrencyEditableTextField(
      BuildContext context, {
        required String label,
        required TextEditingController controller,
        String currency = "IDR", // bisa pilih IDR / USD
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.black12, width: 0.5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1.0,
                blurRadius: 5.0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              CurrencyTextInputFormatter(currency: currency),
            ],
            style: const TextStyle(fontSize: 16, color: Colors.black87),
            decoration: InputDecoration(
              hintText: "Ketik ${label} disini",
              fillColor: Colors.white,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 0.2),
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 0.2),
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              counterText: "",
            ),
          ),
        ),
      ],
    );
  }

  /// 🔥 Gunakan ini untuk ambil nilai "mentah" tanpa format
  static String getRawCurrencyValue(TextEditingController controller) {
    return controller.text.replaceAll(RegExp(r'[^0-9]'), '');
  }
}