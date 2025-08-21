import 'package:flutter/material.dart';

class CustomTextFields {
   // Helper method to build a common editable text field
  static Widget buildEditableTextField(
      BuildContext context, {
        required String label,
        required TextEditingController controller,
        TextInputType keyboardType = TextInputType.text,
        int? maxLines = 1,
        int? maxLength,
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
    );
  }

  // Helper method for the date picker text field
  static Widget buildDatePickerField(
      BuildContext context, {
        required String label,
        required TextEditingController controller,
        required VoidCallback onTap,
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
    );
  }

  // Helper method to build a styled read-only text field (from previous example)
  static Widget buildReadOnlyField(
      BuildContext context, {
        required String label,
        required String value,
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
    );
  }
}