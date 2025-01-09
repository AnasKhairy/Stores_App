import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/my_textfield.dart';

class AddDetailsShop extends StatefulWidget {
  const AddDetailsShop({super.key});

  @override
  State<AddDetailsShop> createState() => _AddDetailsShopState();
}

class _AddDetailsShopState extends State<AddDetailsShop> {
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _tenantNameController = TextEditingController();
  final TextEditingController _tenantNumberController = TextEditingController();
  final TextEditingController _numberOfPaymentsController =
      TextEditingController();

  String? _rentalPeriodController;
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _tenatIdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  DateTime? dueDate;

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
          child: Column(
            children: [
              MyTextfield(
                  hintText: 'Enter Shop Name',
                  obscure: false,
                  controller: _shopNameController),
              const SizedBox(height: 20),
              MyTextfield(
                  hintText: 'Enter Tenant Name ',
                  obscure: false,
                  controller: _tenantNameController),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    selectedDate == null
                        ? 'Add Rent Date'
                        : '$selectedDate'.split(' ')[0],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                hint: const Text('Select Rental Period'),
                value: _rentalPeriodController,
                onChanged: (String? newValue) {
                  setState(() {
                    _rentalPeriodController = newValue;
                  });
                },
                items: <String>['monthly', 'yearly']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _numberOfPaymentsController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                decoration: const InputDecoration(
                  labelText: 'Enter Number Of Payments',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    dueDate == null ? 'Add due Date' : '$dueDate'.split(' ')[0],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Perform registration logic here
      String name = _shopNameController.text;
      // Use the name, email, and selectedDate for registration
      // For example, send to a backend or save locally
      print('Name: $name, Date of Birth: $selectedDate, picked: ');
    }
  }
}
