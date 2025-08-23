import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/dropdowns/default_drop_down.dart';
import 'package:forex_regol/src/components/textfields/textfields.dart';
import 'package:forex_regol/src/components/texts/texts.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/components/utilities/utilities.dart';
import 'package:forex_regol/src/views/utilities/statement_text.dart';
import 'package:get/get.dart';
import 'halaman_dua_belas_pernyataan_dana_pribadi.dart';

class HalamanSebelasPernyataanBertanggungJawab extends StatefulWidget {
  const HalamanSebelasPernyataanBertanggungJawab({super.key});

  @override
  State<HalamanSebelasPernyataanBertanggungJawab> createState() => _HalamanSebelasPernyataanBertanggungJawab();
}

class _HalamanSebelasPernyataanBertanggungJawab extends State<HalamanSebelasPernyataanBertanggungJawab> {
  TextEditingController nameController = TextEditingController();
  TextEditingController demoAccountController = TextEditingController();
  TextEditingController placeBirthController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  TextEditingController idTypeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController rtController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController zipController = TextEditingController();

  RxString selectedJenisIdentitas = "KTP".obs;
  RxList<String> jenisIdentitas = <String>["KTP", "Passport"].obs;


  @override
  void dispose() {
    demoAccountController.dispose();
    nameController.dispose();
    placeBirthController.dispose();
    dateBirthController.dispose();
    idTypeController.dispose();
    addressController.dispose();
    rtController.dispose();
    identityNumberController.dispose();
    zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultScaffold(
      onPressed: (){
        Get.to(() => const HalamanDuaBelasPernyataanDanaPribadi());
      },
      withBottomMenu: true,
      title: "",
      children: [
        CustomText.titleMedium(context, text: "Formulir Dokumen Pernyataan Bertanggung Jawab Atas Kode Akses Transaksi Nasabah (Personal Access Password)"),
        const SizedBox(height: 15.0),
        CustomText.titleMedium(context, text: "PERNYATAAN BERTANGGUNG JAWAB ATAS KODE AKSES TRANSAKSI NASABAH (Personal Access Password)"),
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
                label: 'RT',
                controller: rtController,
                keyboardType: TextInputType.number,
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        CustomTextFields.buildEditableTextField(
          context,
          readOnly: true,
          label: 'No. Akun Demo',
          controller: demoAccountController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15),
        StatementWidget.kodeAkses(),
        const SizedBox(height: 15),
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("PERINGATAN !", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700)),
              const SizedBox(height: 15),
              Text("Pialang Berjangka, Wakil Pialang Berjangka, pegawai Pialang Berjangka, atau Pihak yang memiliki kepentingan dengan dengan Pialang Berjangka dilarang menerima kode akses transaksi Nasabah (Personal Access Password).", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
            ],
          ),
        ),
        const SizedBox(height: 15),
        CustomText.normal(context, text: "Demikian Pernyataan ini dibuat dengan sebenarnya dalam keadaan sadar, sehat jasmani dan rohani serta tanpa paksaan apapun dari pihak manapun"),
      ],
    );
  }
}
