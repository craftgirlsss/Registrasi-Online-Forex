import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/dropdowns/default_drop_down.dart';
import 'package:forex_regol/src/components/textfields/textfields.dart';
import 'package:forex_regol/src/components/texts/texts.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/components/utilities/utilities.dart';
import 'package:get/get.dart';

import 'halaman_enam_aplikasi_pembukaan_rekening_2.dart';

class HalamanEnamAplikasiPembukaanRekening1 extends StatefulWidget {
  const HalamanEnamAplikasiPembukaanRekening1({super.key});

  @override
  State<HalamanEnamAplikasiPembukaanRekening1> createState() => _HalamanEnamAplikasiPembukaanRekening1State();
}

class _HalamanEnamAplikasiPembukaanRekening1State extends State<HalamanEnamAplikasiPembukaanRekening1> {
  TextEditingController nameController = TextEditingController();
  TextEditingController placeBirthController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  TextEditingController idTypeController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController husbandOrWifeNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneHomeController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController zipController = TextEditingController();

  RxString selectedJenisIdentitas = "KTP".obs;
  RxString selectedStatusKepemilikanRumah = "Pribadi".obs;
  RxString selectedGender = "Laki-laki".obs;
  RxString selectedMaritalStatus = "Tidak Kawin".obs;
  RxList<String> jenisIdentitas = <String>["KTP", "Passport"].obs;
  RxList<String> statusKepemilikanRumah = <String>["Pribadi", "Keluarga", "Sewa/Kontrak", "Lainnya"].obs;
  RxList<String> genderList = <String>["Laki-laki", "Perempuan"].obs;
  RxList<String> maritalList = <String>["Tidak Kawin", "Kawin", "Janda", "Duda"].obs;


  @override
  void dispose() {
    nameController.dispose();
    placeBirthController.dispose();
    dateBirthController.dispose();
    idTypeController.dispose();
    taxNumberController.dispose();
    genderController.dispose();
    motherNameController.dispose();
    maritalStatusController.dispose();
    husbandOrWifeNameController.dispose();
    addressController.dispose();
    phoneHomeController.dispose();
    faxController.dispose();
    phoneNumberController.dispose();
    identityNumberController.dispose();
    zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultScaffold(
      onPressed: (){
        Get.to(() => const HalamanEnamAplikasiPembukaanRekening2());
      },
      withBottomMenu: true,
      title: "Aplikasi Pembukaan Rekening #1",
      children: [
        CustomText.titleMedium(context, text: "Data Pribadi"),
        CustomTextFields.buildEditableTextField(
          context,
          label: 'Nama Lengkap',
          controller: nameController,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            SizedBox(
              width: size.width / 3,
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'Tempat Lahir',
                controller: placeBirthController,
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: CustomTextFields.buildDatePickerField(
                context,
                label: 'Tanggal Lahir',
                controller: dateBirthController,
                onTap: () {
                  Utilities.selectDate(context).then((value) {
                    dateBirthController.text = value;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            SizedBox(
              width: size.width / 3,
              child: Obx(
                () => DefaultDropDown.buildDropdownField(
                  context,
                  label: "Gender",
                  value: selectedGender.value,
                  items: genderList,
                  onChanged: (value) => selectedGender(value),
                ),
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: Obx(
                () => DefaultDropDown.buildDropdownField(
                  context,
                  label: "Status Perkawinan",
                  value: selectedMaritalStatus.value,
                  items: maritalList,
                  onChanged: (value) => selectedMaritalStatus(value),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            SizedBox(
              width: size.width / 3,
              child: Obx(
                () => DefaultDropDown.buildDropdownField(
                  context,
                  label: "Jenis Identitas",
                  value: selectedJenisIdentitas.value,
                  items: jenisIdentitas,
                  onChanged: (value) => selectedJenisIdentitas(value),
                ),
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'Nomor Identitas',
                controller: identityNumberController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        CustomTextFields.buildEditableTextField(
          context,
          label: 'Nama Ibu Kandung',
          controller: motherNameController,
          keyboardType: TextInputType.name,
        ),
        Obx(
          () => selectedMaritalStatus == "Tidak Kawin" ? const SizedBox() : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              CustomTextFields.buildEditableTextField(
                context,
                label: 'Nama Suami / Istri',
                controller: motherNameController,
                keyboardType: TextInputType.name,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        CustomTextFields.buildEditableTextField(
          context,
          label: 'Alamat',
          controller: addressController,
          keyboardType: TextInputType.streetAddress,
          maxLines: 5, // Allow multiple lines for address
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            SizedBox(
              width: size.width / 3,
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'Kode Pos',
                controller: zipController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'No. Telp Rumah',
                controller: phoneHomeController,
                keyboardType: TextInputType.number,
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        CustomTextFields.buildEditableTextField(
          context,
          label: 'Nomor NPWP',
          controller: taxNumberController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'Nomor HP',
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'Nomor Faksimili',
                controller: faxController,
                keyboardType: TextInputType.number,
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        Obx(
          () => DefaultDropDown.buildDropdownField(
            context,
            label: "Status Kepemilikan Rumah",
            value: selectedStatusKepemilikanRumah.value,
            items: statusKepemilikanRumah,
            onChanged: (value) => selectedStatusKepemilikanRumah(value),
          ),
        ),
      ],
    );
  }
}
