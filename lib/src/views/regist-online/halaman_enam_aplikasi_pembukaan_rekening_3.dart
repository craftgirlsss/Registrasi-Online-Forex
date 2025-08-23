import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/dropdowns/default_drop_down.dart';
import 'package:forex_regol/src/components/textfields/textfields.dart';
import 'package:forex_regol/src/components/texts/texts.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:get/get.dart';

import 'halaman_enam_aplikasi_pembukaan_rekening_4.dart';

class HalamanEnamAplikasiPembukaanRekening3 extends StatefulWidget {
  const HalamanEnamAplikasiPembukaanRekening3({super.key});

  @override
  State<HalamanEnamAplikasiPembukaanRekening3> createState() => _HalamanEnamAplikasiPembukaanRekening3State();
}

class _HalamanEnamAplikasiPembukaanRekening3State extends State<HalamanEnamAplikasiPembukaanRekening3> {
  TextEditingController namaPerusahaanController = TextEditingController();
  TextEditingController bidangUsahaController = TextEditingController();
  TextEditingController jabatanController = TextEditingController();
  TextEditingController lamaBekerjaController = TextEditingController();
  TextEditingController lamaBekerjaKantorSebelumnyaController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController noFaximiliController = TextEditingController();
  TextEditingController rumahLokasiController = TextEditingController();
  TextEditingController nilaiNJOPController = TextEditingController();
  TextEditingController depositBankController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController lainnyaController = TextEditingController();
  RxString selectedTujuanPembukaanRekening = 'Lindung Nilai'.obs;
  RxString selectedPenghasilan = 'Antara 100-250 juta'.obs;
  RxString selectedMemilikiKeluargaBappebti = 'Tidak'.obs;
  RxString selectedPekerjaan = 'Swasta'.obs;
  RxString selectedDinyatakanPailit = 'Tidak'.obs;

  RxList<String> tujuanPembukaanRekening = <String>["Lindung Nilai", "Gain", "Spekulasi", "Lainnya"].obs;
  RxList<String> penghasilan = <String>["Antara 100-250 juta", "Antara 250-500 juta", "Diatas 500 juta"].obs;
  RxList<String> informasiPekerjaan = <String>["Swasta", "Wiraswasta", "Ibu RT", "Profesional", "ASN", "Pegawai BUMN", "Lainnya"].obs;
  RxList<String> memilikiKeluargaBappebti = <String>["Ya", "Tidak"].obs;

  @override
  void dispose() {
    bidangUsahaController.dispose();
    namaPerusahaanController.dispose();
    jabatanController.dispose();
    lamaBekerjaController.dispose();
    lamaBekerjaKantorSebelumnyaController.dispose();
    addressController.dispose();
    zipController.dispose();
    noTelpController.dispose();
    noFaximiliController.dispose();
    rumahLokasiController.dispose();
    nilaiNJOPController.dispose();
    depositBankController.dispose();
    jumlahController.dispose();
    lainnyaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultScaffold(
      onPressed: (){
        Get.to(() => const HalamanEnamAplikasiPembukaanRekening4());
      },
      withBottomMenu: true,
      title: "Aplikasi Pembukaan Rekening #3",
      children: [
        CustomText.titleMedium(context, text: "Informasi Pekerjaan Anda"),
        const SizedBox(height: 15),
        Row(
          children: [
            SizedBox(
              width: size.width / 3,
              child: Obx(
                () => DefaultDropDown.buildDropdownField(
                  context,
                  label: "Pekerjaan",
                  value: selectedPekerjaan.value,
                  items: informasiPekerjaan,
                  onChanged: (value) => selectedPekerjaan(value),
                ),
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'Nama Perusahaan',
                controller: namaPerusahaanController,
                keyboardType: TextInputType.name,
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
                label: 'Bidang Usaha',
                controller: bidangUsahaController,
                keyboardType: TextInputType.name,
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'Jabatan',
                controller: jabatanController,
                keyboardType: TextInputType.name,
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
                label: 'Lama Bekerja',
                controller: lamaBekerjaController,
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: CustomTextFields.buildEditableTextField(
                context,
                label: 'Kantor Sebelumnya',
                controller: lamaBekerjaKantorSebelumnyaController,
                keyboardType: TextInputType.text,
              ),
            ),
          ],
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
                label: 'No. Telp Kantor',
                controller: noTelpController,
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
          label: 'No. Faksimili',
          controller: noFaximiliController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 30),
        CustomText.titleMedium(context, text: "Daftar Kekayaan"),
        const SizedBox(height: 15),
        Obx(
          () => DefaultDropDown.buildDropdownField(
            context,
            label: "Penghasilan Per Tahun",
            value: selectedPenghasilan.value,
            items: penghasilan,
            onChanged: (value) => selectedPenghasilan(value),
          ),
        ),
        const SizedBox(height: 15),
        CustomTextFields.buildEditableTextField(
          context,
          label: 'Rumah Lokasi',
          controller: rumahLokasiController,
          keyboardType: TextInputType.streetAddress,
          maxLines: 5, // Allow multiple lines for address
        ),
        const SizedBox(height: 15),
        CustomTextFields.buildCurrencyEditableTextField(
          context,
          label: 'Nilai NJOP',
          controller: nilaiNJOPController,
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: CustomTextFields.buildCurrencyEditableTextField(
                context,
                label: 'Deposit Bank',
                controller: depositBankController,
              ),
            ),
            const SizedBox(width: 5.0),
            Expanded(
              child: CustomTextFields.buildCurrencyEditableTextField(
                context,
                label: 'Jumlah',
                controller: jumlahController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        CustomTextFields.buildCurrencyEditableTextField(
          context,
          label: 'Lainnya',
          controller: lainnyaController,
        ),
      ],
    );
  }
}
