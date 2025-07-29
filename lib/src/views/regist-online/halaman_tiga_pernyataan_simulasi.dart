import 'package:flutter/material.dart';
import 'package:forex_regol/src/controllers/regist_online_controller.dart';
import 'package:get/get.dart';

class PersonalInfoFormScreen extends StatelessWidget {
  PersonalInfoFormScreen({super.key});

  final PersonalInfoController controller = Get.put(PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Informasi Personal',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(), // Dismiss keyboard on tap outside
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Subtitle as per "PERNYATAAN..." image
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'PERNYATAAN TELAH MELAKUKAN SIMULASI TRANSAKSI KONTRAK DERIVATIF DALAM SISTEM PERDAGANGAN ALTERNATIF', // Static title
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF263351),
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Yang mengisi formulir dibawah ini',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),

              // Form Fields
              _buildEditableTextField(
                context,
                label: 'Nama Lengkap',
                controller: controller.fullNameController,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              _buildEditableTextField(
                context,
                label: 'Tempat Lahir',
                controller: controller.birthPlaceController,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              _buildDatePickerField(
                context,
                label: 'Tanggal Lahir',
                controller: controller.birthDateController,
                onTap: () => controller.selectDate(context),
              ),
              const SizedBox(height: 20),
              _buildEditableTextField(
                context,
                label: 'Alamat Rumah',
                controller: controller.homeAddressController,
                keyboardType: TextInputType.streetAddress,
                maxLines: 3, // Allow multiple lines for address
              ),
              const SizedBox(height: 20),
              _buildEditableTextField(
                context,
                label: 'Kode Pos',
                controller: controller.postalCodeController,
                keyboardType: TextInputType.number,
                maxLength: 5, // Common postal code length
              ),
              const SizedBox(height: 20),
              _buildEditableTextField(
                context,
                label: 'Tipe Identitas',
                controller: controller.idTypeController,
                keyboardType: TextInputType.text,
                // You might replace this with a dropdown later
              ),
              const SizedBox(height: 20),
              _buildEditableTextField(
                context,
                label: 'No. Identitas',
                controller: controller.idNumberController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              _buildReadOnlyField(
                context,
                label: 'No. Demo Acc',
                value: controller.demoAccount,
              ),

              const SizedBox(height: 40),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Simpan Data',
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a common editable text field
  Widget _buildEditableTextField(
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
            borderRadius: BorderRadius.circular(12),
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
            keyboardType: keyboardType,
            maxLines: maxLines,
            maxLength: maxLength,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              border: InputBorder.none, // Remove default TextField border
              counterText: "", // Hide character counter for maxLength
            ),
          ),
        ),
      ],
    );
  }

  // Helper method for the date picker text field
  Widget _buildDatePickerField(
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
            borderRadius: BorderRadius.circular(12),
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
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              border: InputBorder.none,
              suffixIcon: Icon(Icons.calendar_today, color: Colors.grey), // Calendar icon
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to build a styled read-only text field (from previous example)
  Widget _buildReadOnlyField(
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