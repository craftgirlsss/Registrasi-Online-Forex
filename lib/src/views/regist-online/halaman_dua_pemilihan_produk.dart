import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/buttons/buttons.dart';
import 'package:forex_regol/src/components/dropdowns/default_drop_down.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/controllers/regist_online_controller.dart';
import 'package:get/get.dart';
import 'halaman_tiga_pernyataan_simulasi.dart';

class HalamanDuaProfilPerusahaan extends StatelessWidget {
  HalamanDuaProfilPerusahaan({super.key});

  final TradeFormController controller = Get.put(TradeFormController());

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      withBottomMenu: false,
      title: "Rate dan Jenis Real Account",
      onPressed: (){},
        children: [
          Obx(
            () => DefaultDropDown.buildDropdownField(
              context,
              label: 'Pilih Produk (*)',
              value: controller.selectedProduct.value,
              items: controller.availableProducts,
              onChanged: controller.onProductChanged,
            ),
          ),
          const SizedBox(height: 20),

          DefaultDropDown.buildReadOnlyField(
            context,
            label: 'Akun Demo (*)',
            value: controller.demoAccount,
          ),
          const SizedBox(height: 20),

          Obx(
            () => DefaultDropDown.buildDropdownField(
              context,
              label: 'Pilih Currency (*)',
              value: controller.selectedCurrency.value,
              items: controller.availableCurrencies,
              onChanged: controller.onCurrencyChanged,
            ),
          ),
          const SizedBox(height: 20),

          Obx(
            () => DefaultDropDown.buildDropdownField(
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
                    child: DefaultDropDown.buildProductOptionCard(option), // Use the new helper
                  );
                }).toList(),
              ],
            );
          }),

          const SizedBox(height: 20),
          CustomButton.defaultButton(
            onPressed: (){
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
            }
          ),
        ],
    );
  }

  // (_buildDropdownField and _buildReadOnlyField remain the same)
}