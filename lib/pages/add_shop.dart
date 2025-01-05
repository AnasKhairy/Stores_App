import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../components/my_textfield.dart';
import 'more_info.dart';

class AddShop extends StatefulWidget {
  AddShop({super.key});

  @override
  State<AddShop> createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _tenantNameController = TextEditingController();
  final TextEditingController _tenantNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  DateTime? dueDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AddDetailsShop'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                MyTextfield(
                    hintText: 'Enter Name Shop',
                    obscure: false,
                    controller: _shopNameController),
                SizedBox(height: 20),
                MyTextfield(
                    hintText: 'Enter Tenant Name ',
                    obscure: false,
                    controller: _tenantNameController),
                SizedBox(height: 20),
                TextField(
                  controller: _tenantNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Allow only digits
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Enter Tenant Number',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: goTo,
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ));
  }

  void goTo() {
    Get.to(() => MoreInfo());
  }
}
