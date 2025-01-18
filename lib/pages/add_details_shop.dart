import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el_fares/pages/home_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../components/my_textfield.dart';

class AddDetailsShop extends StatefulWidget {
  final String marketId;
  const AddDetailsShop({super.key, required this.marketId});

  @override
  State<AddDetailsShop> createState() => _AddDetailsShopState();
}

class _AddDetailsShopState extends State<AddDetailsShop> {
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _tenantNameController = TextEditingController();
  final TextEditingController _tenantNumberController = TextEditingController();
  final TextEditingController _paymentAmountController =
      TextEditingController();
  String? _rentalPeriodController;
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  File? _selectedImage;
  bool _isUploading = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

/*   Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  } */

/*   Future<String?> _uploadImage() async {
    if (_selectedImage == null) return null;

    setState(() {
      _isUploading = true;
    });

    try {
      final storageRef = _storage
          .ref()
          .child('market_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      final uploadTask = await storageRef.putFile(_selectedImage!);
      final imageUrl = await uploadTask.ref.getDownloadURL();

      setState(() {
        _isUploading = false;
      });

      return imageUrl;
    } catch (e) {
      setState(() {
        _isUploading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $e')),
      );
      return null;
    }
  } */

  void _addShop() async {
    if (!_formKey.currentState!.validate()) return;

    /* final imageUrl = await _uploadImage(); */

    final shopData = {
      'shop_name': _shopNameController.text,
      'tenant_name': _tenantNameController.text,
      'tenant_number': _tenantNumberController.text,
      'payments_amount': _paymentAmountController.text,
      'rental_period': _rentalPeriodController,
      'rent_date': selectedDate,
      // 'image_url': imageUrl,
    };

    await _firestore
        .collection('markets')
        .doc(widget.marketId)
        .collection('stores')
        .add(shopData);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Shop added successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    Get.offAll(() => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Shop Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyTextfield(
                  hintText: 'Enter Shop Name',
                  obscure: false,
                  controller: _shopNameController,
                ),
                const SizedBox(height: 20),
                MyTextfield(
                  hintText: 'Enter Tenant Name',
                  obscure: false,
                  controller: _tenantNameController,
                ),
                const SizedBox(height: 20),
                MyTextfield(
                  hintText: 'Enter Tenant Number',
                  obscure: false,
                  controller: _tenantNumberController,
                ),
                const SizedBox(height: 20),
                DropdownButton<String>(
                  hint: const Text('Select Rental Period'),
                  value: _rentalPeriodController,
                  onChanged: (String? value) {
                    setState(() {
                      _rentalPeriodController = value;
                    });
                  },
                  items: ['Monthly', 'Yearly'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      selectedDate == null
                          ? 'Select Rent Date'
                          : '${selectedDate!.toLocal()}'.split(' ')[0],
                    ),
                  ),
                ),
                MyTextfield(
                  hintText: 'Enter Payments Amount',
                  obscure: false,
                  controller: _paymentAmountController,
                  keyboardType: TextInputType.number,
                ),
                /* const SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      image: _selectedImage != null
                          ? DecorationImage(
                              image: FileImage(_selectedImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _selectedImage == null
                        ? const Center(child: Text('Tap to select an image'))
                        : null,
                  ),
                ), */
                if (_isUploading) const CircularProgressIndicator(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addShop,
                  child: const Text('Add Shop'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
