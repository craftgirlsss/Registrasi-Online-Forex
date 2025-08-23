import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/dropdowns/default_drop_down.dart';
import 'package:forex_regol/src/components/textfields/textfields.dart';
import 'package:forex_regol/src/components/texts/texts.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/views/regist-online/halaman_enam_aplikasi_pembukaan_rekening_3.dart';
import 'package:get/get.dart';

class HalamanEnamAplikasiPembukaanRekening2 extends StatefulWidget {
  const HalamanEnamAplikasiPembukaanRekening2({super.key});

  @override
  State<HalamanEnamAplikasiPembukaanRekening2> createState() => _HalamanEnamAplikasiPembukaanRekening2State();
}

class _HalamanEnamAplikasiPembukaanRekening2State extends State<HalamanEnamAplikasiPembukaanRekening2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController hubunganController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  RxString selectedTujuanPembukaanRekening = 'Lindung Nilai'.obs;
  RxString selectedMemilikiKeluargaBappebti = 'Tidak'.obs;
  RxString selectedDinyatakanPailit = 'Tidak'.obs;

  RxList<String> tujuanPembukaanRekening = <String>["Lindung Nilai", "Gain", "Spekulasi", "Lainnya"].obs;
  RxList<String> memilikiKeluargaBappebti = <String>["Ya", "Tidak"].obs;

  @override
  void dispose() {
    hubunganController.dispose();
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultScaffold(
      onPressed: (){
        Get.to(() => HalamanEnamAplikasiPembukaanRekening3());
      },
      withBottomMenu: true,
      title: "Aplikasi Pembukaan Rekening #2",
      children: [
        CustomText.titleMedium(context, text: "Data Pribadi 2"),
        const SizedBox(height: 15),
        Obx(
          () => DefaultDropDown.buildDropdownField(
            context,
            label: "Tujuan Pembukaan Rekening",
            value: selectedTujuanPembukaanRekening.value,
            items: tujuanPembukaanRekening,
            onChanged: (value) => selectedTujuanPembukaanRekening(value),
          ),
        ),
        const SizedBox(height: 15),
        Obx(
          () => DefaultDropDown.buildDropdownField(
            context,
            label: "Memiliki keluarga di BAPPEBTI/Bursa Berjangka/Kliring Berjangka",
            value: selectedMemilikiKeluargaBappebti.value,
            items: memilikiKeluargaBappebti,
            onChanged: (value) => selectedMemilikiKeluargaBappebti(value),
          ),
        ),
        const SizedBox(height: 15),
        Obx(
          () => DefaultDropDown.buildDropdownField(
            context,
            label: "Dinyatakan Pailit oleh Pengadilan",
            value: selectedDinyatakanPailit.value,
            items: memilikiKeluargaBappebti,
            onChanged: (value) => selectedDinyatakanPailit(value),
          ),
        ),
        const SizedBox(height: 25),
        CustomText.titleMedium(context, text: "Informasi Kontak Darurat"),
        const SizedBox(height: 15),
        CustomTextFields.buildEditableTextField(
          context,
          label: 'Nama Lengkap',
          controller: nameController,
          keyboardType: TextInputType.name,
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
            Expanded(
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'No. Telp',
                controller: phoneController,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 5.0),
            SizedBox(
              width: size.width / 3,
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'Kode Pos',
                controller: zipController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        CustomTextFields.buildEditableTextField(
          context,
          label: 'Hubungan Dengan Anda',
          controller: hubunganController,
          keyboardType: TextInputType.name,
        ),
      ],
    );
  }
}
