import 'package:el_fares/components/my_textfield.dart';
import 'package:flutter/material.dart';

class AddShop extends StatelessWidget {
   AddShop({super.key});

  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _rentDateController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _numberOfPaymentsController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _ownerNumberController = TextEditingController();
  final TextEditingController _ownerIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Shop'),
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            MyTextfield(hintText: 'Enter Name Shop', obscure: false, controller: _shopNameController),
            SizedBox(
              height: 20,
            ),
            MyTextfield(hintText: 'Enter Rent Date', obscure: false, controller: _rentDateController),
            SizedBox(
              height: 20,
            ),
            MyTextfield(hintText: 'Enter Due Date', obscure: false, controller: _dueDateController),
            SizedBox(
              height: 20,
            ),
            MyTextfield(hintText: 'Enter number of Payments', obscure: false, controller: _numberOfPaymentsController),
            SizedBox(
              height: 20,
            ),
            MyTextfield(hintText: 'Enter Owner Name', obscure: false, controller: _ownerNameController),
            SizedBox(
              height: 20,
            ),
            MyTextfield(hintText: 'Enter Owner Number', obscure: false, controller: _ownerNumberController),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
