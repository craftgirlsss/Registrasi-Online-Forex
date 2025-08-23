import 'dart:io';
import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/buttons/buttons.dart';
import 'package:forex_regol/src/components/dropdowns/default_drop_down.dart';
import 'package:forex_regol/src/components/textfields/textfields.dart';
import 'package:forex_regol/src/components/texts/texts.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/components/utilities/utilities.dart';
import 'package:forex_regol/src/views/utilities/statement_text.dart';
import 'package:get/get.dart';

import 'halaman_tujuh_pengalaman_pengungkapan.dart';

class HalamanEnamAplikasiPembukaanRekening4 extends StatefulWidget {
  const HalamanEnamAplikasiPembukaanRekening4({super.key});

  @override
  State<HalamanEnamAplikasiPembukaanRekening4> createState() => _HalamanEnamAplikasiPembukaanRekening4State();
}

class _HalamanEnamAplikasiPembukaanRekening4State extends State<HalamanEnamAplikasiPembukaanRekening4> {
  TextEditingController cabangBank1Controller = TextEditingController();
  TextEditingController cabangBank2Controller = TextEditingController();
  TextEditingController noTelp1Controller = TextEditingController();
  TextEditingController noTelp2Controller = TextEditingController();
  TextEditingController nomorRekening1Controller = TextEditingController();
  TextEditingController nomorRekening2Controller = TextEditingController();
  RxString selectedBank1 = 'PT Bank Central Asia Tbk'.obs;
  RxString selectedBank2 = 'PT Bank Central Asia Tbk'.obs;
  RxString selectedJenisRekening1 = 'Tabungan'.obs;
  RxString selectedJenisRekening2 = 'Tabungan'.obs;
  RxBool addMoreBank = false.obs;
  File? _selectedFile;

  RxList<String> bank = <String>["PT Bank Central Asia Tbk", "PT Bank Rakyat Indonesia Tbk", "PT Bank Mandiri Tbk"].obs;
  RxList<String> jenisRekening = <String>["Tabungan", "Giro", "Lainnya"].obs;

  @override
  void dispose() {
    cabangBank1Controller.dispose();
    cabangBank2Controller.dispose();
    noTelp1Controller.dispose();
    noTelp2Controller.dispose();
    nomorRekening1Controller.dispose();
    nomorRekening2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultScaffold(
      onPressed: (){
        Get.to(() => const HalamanTujuhPernyataanPengungkapan());
      },
      withBottomMenu: true,
      title: "Aplikasi Pembukaan Rekening #4",
      children: [
        CustomText.titleMedium(context, text: "Informasi Bank 1"),
        const SizedBox(height: 15),
        Obx(
          () => DefaultDropDown.buildDropdownField(
            context,
            label: "Nama Bank",
            value: selectedBank1.value,
            items: bank,
            onChanged: (value) => selectedBank1(value),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'Cabang Bank',
                controller: cabangBank1Controller,
                keyboardType: TextInputType.name,
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'No. Telp',
                controller: noTelp1Controller,
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'No. Rekening Bank',
                controller: nomorRekening1Controller,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 5.0),
            SizedBox(
              width: size.width / 3,
              child: Obx(
                () => DefaultDropDown.buildDropdownField(
                  context,
                  label: "Jenis Rekening",
                  value: selectedJenisRekening1.value,
                  items: jenisRekening,
                  onChanged: (value) => selectedJenisRekening1(value),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        Obx(
          () => CustomButton.defaultButton(
            onPressed: (){
              addMoreBank.value = !addMoreBank.value;
            },
            title: addMoreBank.value ? "Hapus Bank" : "Tambah Bank"
          ),
        ),

        const SizedBox(height: 15),

        Obx(
          () {
           if(addMoreBank.value){
             return Column(
               children: [
                 CustomText.titleMedium(context, text: "Informasi Bank 2"),
                 const SizedBox(height: 15),
                 Obx(
                   () => DefaultDropDown.buildDropdownField(
                     context,
                     label: "Nama Bank",
                     value: selectedBank2.value,
                     items: bank,
                     onChanged: (value) => selectedBank2(value),
                   ),
                 ),
                 const SizedBox(height: 15),
                 Row(
                   children: [
                     Expanded(
                       child: CustomTextFields.buildEditableTextField(
                         context,
                         label: 'Cabang Bank',
                         controller: cabangBank2Controller,
                         keyboardType: TextInputType.name,
                       ),
                     ),
                     const SizedBox(width: 5.0),
                     Expanded(
                       child: CustomTextFields.buildEditableTextField(
                         context,
                         label: 'No. Telp',
                         controller: noTelp2Controller,
                         keyboardType: TextInputType.phone,
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(height: 15),
                 Row(
                   children: [
                     Expanded(
                       child: CustomTextFields.buildEditableTextField(
                         context,
                         label: 'No. Rekening Bank',
                         controller: nomorRekening2Controller,
                         keyboardType: TextInputType.number,
                       ),
                     ),
                     const SizedBox(width: 5.0),
                     SizedBox(
                       width: size.width / 3,
                       child: Obx(
                         () => DefaultDropDown.buildDropdownField(
                           context,
                           label: "Jenis Rekening",
                           value: selectedJenisRekening2.value,
                           items: jenisRekening,
                           onChanged: (value) => selectedJenisRekening2(value),
                         ),
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(height: 15),
               ],
             );
           }
           return SizedBox();
          }
        ),

        const SizedBox(height: 15),
        CustomText.titleSubHead(context, text: "Dokumen Yang Dilampirkan"),
        const SizedBox(height: 15),
        CustomText.titleMedium(context, text: "Rekening Koran Bank / Tagihan Kartu Kredit *)"),
        const SizedBox(height: 15),
        Utilities.getImage(
          size: size.width,
          context: context,
          imageURL: _selectedFile?.path,
          onImageSelected: (file) {
            setState(() {
              _selectedFile = file;
            });
          },
        ),
        const SizedBox(height: 15),
        CustomText.titleMedium(context, text: "Rekening listrik/telepon *)"),
        const SizedBox(height: 15),
        Utilities.getImage(
          size: size.width,
          context: context,
          imageURL: _selectedFile?.path,
          onImageSelected: (file) {
            setState(() {
              _selectedFile = file;
            });
          },
        ),
        const SizedBox(height: 15),
        CustomText.titleMedium(context, text: "Foto Terkini *)"),
        const SizedBox(height: 15),
        Utilities.getImage(
          size: size.width,
          context: context,
          imageURL: _selectedFile?.path,
          onImageSelected: (file) {
            setState(() {
              _selectedFile = file;
            });
          },
        ),
        const SizedBox(height: 15),
        CustomText.titleMedium(context, text: "KTP/Passport *)"),
        const SizedBox(height: 15),
        Utilities.getImage(
          size: size.width,
          context: context,
          imageURL: _selectedFile?.path,
          onImageSelected: (file) {
            setState(() {
              _selectedFile = file;
            });
          },
        ),
        const SizedBox(height: 15),
        StatementWidget.pernyataanKebenaranDanTanggungJawab(),
      ],
    );
  }
}
