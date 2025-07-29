import 'package:flutter/material.dart';
import 'package:forex_regol/src/controllers/regist_online_controller.dart';
import 'package:get/get.dart';

import 'halaman_tiga_pernyataan_simulasi.dart';

class TradeFormScreen extends StatelessWidget {
  TradeFormScreen({super.key});

  final TradeFormController controller = Get.put(TradeFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Pilih Produk Perdagangan',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => _buildDropdownField(
                context,
                label: 'Pilih Produk (*)',
                value: controller.selectedProduct.value,
                items: controller.availableProducts,
                onChanged: controller.onProductChanged,
              ),
            ),
            const SizedBox(height: 20),

            _buildReadOnlyField(
              context,
              label: 'Akun Demo (*)',
              value: controller.demoAccount,
            ),
            const SizedBox(height: 20),

            Obx(
              () => _buildDropdownField(
                context,
                label: 'Pilih Currency (*)',
                value: controller.selectedCurrency.value,
                items: controller.availableCurrencies,
                onChanged: controller.onCurrencyChanged,
              ),
            ),
            const SizedBox(height: 20),

            Obx(
              () => _buildDropdownField(
                context,
                label: 'Pilih Rate (*)',
                value: controller.selectedRate.value,
                items: controller.availableRates,
                onChanged: controller.onRateChanged,
              ),
            ),
            const SizedBox(height: 30),

            // Dynamically generated Product Details Cards
            Obx(() {
              // If no options, hide the entire section
              if (controller.currentProductOptions.isEmpty) {
                return const SizedBox.shrink();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      'Opsi ${controller.selectedProduct.value}:', // Title for the options list
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  // Map each ProductOption to a card
                  ...controller.currentProductOptions.map((option) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0), // Space between cards
                      child: _buildProductOptionCard(option), // Use the new helper
                    );
                  }).toList(),
                ],
              );
            }),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    'Form Submitted',
                    'Product: ${controller.selectedProduct.value}\nCurrency: ${controller.selectedCurrency.value}\nRate: ${controller.selectedRate.value}',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green.shade100,
                    colorText: Colors.green.shade800,
                  );
                  Future.delayed(const Duration(seconds: 2), (){
                    Get.to(() => PersonalInfoFormScreen());
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Lanjutkan',
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // (_buildDropdownField and _buildReadOnlyField remain the same)

  Widget _buildDropdownField(
      BuildContext context, {
        required String label,
        required String value,
        required RxList<String> items,
        required ValueChanged<String?> onChanged,
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
        Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                onChanged: onChanged,
                items: items.map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

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
            color: Colors.grey.shade200,
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


  // Helper method to build a single product option card
  Widget _buildProductOptionCard(ProductOption option) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.check_circle_outline, color: Colors.green, size: 24), // Icon for option
              const SizedBox(width: 10),
              // Could add a title for each option if applicable, e.g., "Standard Account"
              Text(
                'Opsi Trading', // General title for the option
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const Divider(height: 25, thickness: 0.8, color: Colors.grey),
          _buildDetailRow('Minimum Deposit', option.minimumDeposit),
          _buildDetailRow('Leverage', option.leverage),
          _buildDetailRow('Commission', option.commission),
          if (option.notes != null && option.notes!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              'Catatan: ${option.notes}',
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Helper method for detail rows in the card (remains the same)
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}