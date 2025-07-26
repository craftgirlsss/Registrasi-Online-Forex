import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/texts/texts.dart';
import 'package:forex_regol/src/components/themes/custom_scaffold.dart';
import 'package:forex_regol/src/views/regist-online/web_socket_page.dart';
import 'package:get/get.dart';

class HalamanDuaPemilihanProduk extends StatefulWidget {
  const HalamanDuaPemilihanProduk({super.key});

  @override
  State<HalamanDuaPemilihanProduk> createState() => _HalamanDuaPemilihanProdukState();
}

class _HalamanDuaPemilihanProdukState extends State<HalamanDuaPemilihanProduk> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      onPressed: (){
        Get.to(() => const WebSocketSymbolTablePage());
      },
      children: [
        CustomText.titleHeadingPage(context, text: "PEMILIHAN PRODUK FOREX"),
      ],
    );
  }
}