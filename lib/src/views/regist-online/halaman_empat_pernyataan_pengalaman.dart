import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/buttons/buttons.dart';
import 'package:forex_regol/src/components/dropdowns/default_drop_down.dart';
import 'package:forex_regol/src/components/textfields/textfields.dart';
import 'package:forex_regol/src/components/texts/texts.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:get/get.dart';

import 'halaman_lima_pernyataan_pengungkapan.dart';

class HalamanEmpatPernyataanPengalaman extends StatefulWidget {
  const HalamanEmpatPernyataanPengalaman({super.key});

  @override
  State<HalamanEmpatPernyataanPengalaman> createState() => _HalamanEmpatPernyataanPengalamanState();
}

class _HalamanEmpatPernyataanPengalamanState extends State<HalamanEmpatPernyataanPengalaman> {
  RxList<String> listYesOrNo = <String>["Ya","Tidak"].obs;
  RxString selected = "Ya".obs;
  TextEditingController namaPerusahaanPialang = TextEditingController();

  @override
  void dispose() {
    namaPerusahaanPialang.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      withBottomMenu: false,
      onPressed: (){},
      title: "Pernyataan Pengalaman Transaksi",
      children: [
        CustomText.titleHeadingPage(context, text: "PERNYATAAN TELAH MELAKUKAN BERPENGALAMAN MELAKSAKAN TRANSAKSI PERDAGANGAN BERJANGKA KOMODITI"),
        const SizedBox(height: 30.0),
        CustomText.titleSubHead(context, text: "Apakah Sudah Berpengalaman atau Belum?"),
        const SizedBox(height: 10.0),
        Obx(
          () => DefaultDropDown.buildDropdownField(
            context,
            label: 'Pernyataan Berpengalaman',
            value: selected.value,
            items: listYesOrNo,
            onChanged: (value) => selected(value),
          ),
        ),
        const SizedBox(height: 15.0),
        Obx(() => selected.value == "Ya" ? CustomTextFields.buildEditableTextField(context, label: "Nama Perusahaan Pialang", controller: namaPerusahaanPialang) : const SizedBox()),
        const SizedBox(height: 35.0),
        CustomButton.defaultButton(
          onPressed: (){
            Get.snackbar(
              'Form Submitted',
              '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.shade100,
              colorText: Colors.green.shade800,
            );
            Future.delayed(const Duration(seconds: 2), (){
              Get.to(() => const HalamanLimaPernyataanPengungkapan());
            });
          }
        ),
      ],
    );
  }
}
