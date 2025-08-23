import 'package:flutter/material.dart';
import 'package:forex_regol/src/components/themes/themes.dart';
import 'package:forex_regol/src/views/regist-online/halaman_satu_profil_perusahaan.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Regol App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HalamanSatuProfilPerusahaan(),
    );
  }
}