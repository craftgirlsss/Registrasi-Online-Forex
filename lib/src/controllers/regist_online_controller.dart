// Controller for managing form state and data
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For state management and reactive UI

// Define a simple model for product details
// lib/models/product_models.dart
class ProductOption {
  final String minimumDeposit;
  final String leverage;
  final String commission;
  final String? notes; // Optional notes for the option

  ProductOption({
    required this.minimumDeposit,
    required this.leverage,
    required this.commission,
    this.notes,
  });
}

class Product {
  final String name;
  final List<ProductOption> options;

  Product({
    required this.name,
    required this.options,
  });
}

class TradeFormController extends GetxController {
  final RxString selectedProduct = 'SPA (KOMODITI)'.obs;
  final RxString selectedCurrency = 'IDR'.obs;
  final RxString selectedRate = 'Rp10.000,00'.obs;

  final String demoAccount = '11000031';

  final RxList<String> availableProducts = <String>[
    'SPA (KOMODITI)',
    'FOREX (MAJOR)',
    'INDICES (ASIA)',
    'CRUDE OIL (WTI)',
  ].obs;

  final RxList<String> availableCurrencies = <String>[
    'IDR',
    'USD',
    'EUR',
    'JPY',
  ].obs;

  final RxList<String> availableRates = <String>[
    'Rp10.000,00',
    'Rp15.000,00',
    'Rp20.000,00',
    'Rp25.000,00',
  ].obs;

  // Change this to hold a list of ProductOption
  final RxList<ProductOption> currentProductOptions = <ProductOption>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadProductOptions(selectedProduct.value);
    ever(selectedProduct, _loadProductOptions);
  }

  // Function to load product options based on selected product
  void _loadProductOptions(String product) {
    List<ProductOption> options;
    switch (product) {
      case 'SPA (KOMODITI)':
        options = [
          ProductOption(
            minimumDeposit: 'IDR 20,000,000',
            leverage: '1:100',
            commission: '\$30',
          ),
          ProductOption(
            minimumDeposit: 'IDR 50,000,000',
            leverage: '1:200',
            commission: '\$20',
            notes: 'Cocok untuk trader berpengalaman.',
          ),
        ];
        break;
      case 'FOREX (MAJOR)':
        options = [
          ProductOption(
            minimumDeposit: 'USD 1,000',
            leverage: '1:200',
            commission: '\$7 per lot',
          ),
          ProductOption(
            minimumDeposit: 'USD 5,000',
            leverage: '1:400',
            commission: '\$5 per lot',
            notes: 'Spread lebih rendah.',
          ),
          ProductOption(
            minimumDeposit: 'USD 100',
            leverage: '1:100',
            commission: '\$10 per lot',
            notes: 'Akun mikro untuk pemula.',
          ),
        ];
        break;
      case 'INDICES (ASIA)':
        options = [
          ProductOption(
            minimumDeposit: 'IDR 50,000,000',
            leverage: '1:50',
            commission: '\$50',
          ),
          ProductOption(
            minimumDeposit: 'IDR 100,000,000',
            leverage: '1:100',
            commission: '\$40',
            notes: 'Akses ke lebih banyak indeks.',
          ),
        ];
        break;
      case 'CRUDE OIL (WTI)':
        options = [
          ProductOption(
            minimumDeposit: 'USD 5,000',
            leverage: '1:100',
            commission: '\$10 per barrel',
          ),
          ProductOption(
            minimumDeposit: 'USD 10,000',
            leverage: '1:200',
            commission: '\$8 per barrel',
            notes: 'Untuk trading volume besar.',
          ),
        ];
        break;
      default:
        options = [];
    }
    currentProductOptions.assignAll(options); // Update the reactive list
  }

  void onProductChanged(String? newValue) {
    if (newValue != null) {
      selectedProduct.value = newValue;
    }
  }

  void onCurrencyChanged(String? newValue) {
    if (newValue != null) {
      selectedCurrency.value = newValue;
    }
  }

  void onRateChanged(String? newValue) {
    if (newValue != null) {
      selectedRate.value = newValue;
    }
  }
}

// lib/controllers/personal_info_controller.dart

class PersonalInfoController extends GetxController {
  // TextEditingControllers for editable fields
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController(); // For date picker
  final TextEditingController homeAddressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController idTypeController = TextEditingController(); // Could be a dropdown
  final TextEditingController idNumberController = TextEditingController();

  // Read-only field
  final String demoAccount = 'DVIGO025'; // This value is static for now

  @override
  void onInit() {
    super.onInit();
    // Initialize with dummy data (optional, for testing)
    fullNameController.text = 'kholid hikam';
    birthPlaceController.text = 'tuban';
    birthDateController.text = '11/11/2000'; // Initial date string
    homeAddressController.text = 'tuban';
    postalCodeController.text = '34234';
    idTypeController.text = 'KTP';
    idNumberController.text = '3523598756747567';
  }

  @override
  void onClose() {
    // Dispose all controllers to prevent memory leaks
    fullNameController.dispose();
    birthPlaceController.dispose();
    birthDateController.dispose();
    homeAddressController.dispose();
    postalCodeController.dispose();
    idTypeController.dispose();
    idNumberController.dispose();
    super.onClose();
  }

  // Method to handle date picking
  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      // Format the date as dd/MM/yyyy or as desired
      birthDateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  // You can add validation logic or data submission methods here
  void submitForm() {
    // Example: Print all values
    print('Nama Lengkap: ${fullNameController.text}');
    print('Tempat Lahir: ${birthPlaceController.text}');
    print('Tanggal Lahir: ${birthDateController.text}');
    print('Alamat Rumah: ${homeAddressController.text}');
    print('Kode Pos: ${postalCodeController.text}');
    print('Tipe Identitas: ${idTypeController.text}');
    print('No. Identitas: ${idNumberController.text}');
    print('No. Demo Acc: ${demoAccount}');

    Get.snackbar(
      'Form Submitted',
      'Data personal telah disimpan!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.shade100,
      colorText: Colors.green.shade800,
    );
  }
}