import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/textfields/textfields.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/controllers/regist_online_controller.dart';
import 'package:forex_regol/src/views/utilities/statement_text.dart';
import 'package:get/get.dart';

import 'halaman_empat_pernyataan_pengalaman.dart';

class PersonalInfoFormScreen extends StatelessWidget {
  PersonalInfoFormScreen({super.key});

  final PersonalInfoController controller = Get.put(PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: "Pernyataan Simulasi Perdagangan Berjangka",
      withBottomMenu: true,
      onPressed: () => Get.to(() => const HalamanEmpatPernyataanPengalaman()),
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
          CustomTextFields.buildEditableTextField(
            context,
            label: 'Nama Lengkap',
            controller: controller.fullNameController,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 20),
          CustomTextFields.buildEditableTextField(
            context,
            label: 'Tempat Lahir',
            controller: controller.birthPlaceController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          CustomTextFields.buildDatePickerField(
            context,
            label: 'Tanggal Lahir',
            controller: controller.birthDateController,
            onTap: () => controller.selectDate(context),
          ),
          const SizedBox(height: 20),
          CustomTextFields.buildEditableTextField(
            context,
            label: 'Alamat Rumah',
            controller: controller.homeAddressController,
            keyboardType: TextInputType.streetAddress,
            maxLines: 3, // Allow multiple lines for address
          ),
          const SizedBox(height: 20),
          CustomTextFields.buildEditableTextField(
            context,
            label: 'Kode Pos',
            controller: controller.postalCodeController,
            keyboardType: TextInputType.number,
            maxLength: 5, // Common postal code length
          ),
          const SizedBox(height: 20),
          CustomTextFields.buildEditableTextField(
            context,
            label: 'Tipe Identitas',
            controller: controller.idTypeController,
            keyboardType: TextInputType.text,
            // You might replace this with a dropdown later
          ),
          const SizedBox(height: 20),
          CustomTextFields.buildEditableTextField(
            context,
            label: 'No. Identitas',
            controller: controller.idNumberController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          CustomTextFields.buildReadOnlyField(
            context,
            label: 'No. Demo Acc',
            value: controller.demoAccount,
          ),
          StatementWidget.pernyataanTelahMelakukanSimulasi(dynamicTitlePart: "PT. VIG Futures")
        ],
      );
  }
}