import 'package:el_fares/components/my_textfield.dart';
import 'package:flutter/material.dart';

class AddShop extends StatelessWidget {
  AddShop({super.key});

  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _ownerNumberController = TextEditingController();
  final TextEditingController _rentDateController = TextEditingController();
  final TextEditingController _numberOfPaymentsController =
      TextEditingController();

  final TextEditingController _rentalPeriodController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _tenatIdController = TextEditingController();

  // decoration: BoxDecoration(
  // border: Border.all(color: Colors.grey),
  // borderRadius: BorderRadius.circular(12.0),
  // ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Shop'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MyTextfield(
              hintText: 'Enter Name Shop',
              obscure: false,
              controller: _shopNameController,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextfield(
              hintText: 'Enter Rent Date',
              obscure: false,
              controller: _rentDateController,
            ),
            const SizedBox(height: 20),
            MyTextfield(
              hintText: 'Enter Due Date',
              obscure: false,
              controller: _dueDateController,
            ),
            const SizedBox(height: 20),
            MyTextfield(
              hintText: 'Enter number of Payments',
              obscure: false,
              controller: _numberOfPaymentsController,
            ),
            const SizedBox(height: 20),
            MyTextfield(
              hintText: 'Enter Owner Name',
              obscure: false,
              controller: _ownerNameController,
            ),
            const SizedBox(height: 20),
            MyTextfield(
              hintText: 'Enter Owner Number',
              obscure: false,
              controller: _ownerNumberController,
            ),
            const SizedBox(height: 20),
          ],
          //test in test branch
        ),
      ),
    );
  }
}
