import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el_fares/components/my_button.dart';
import 'package:el_fares/components/my_textfield.dart';
import 'package:el_fares/pages/add_details_shop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMarket extends StatelessWidget {
  AddMarket({super.key});

  final TextEditingController _marketNameController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addStore() {
    _firestore
        .collection('stores')
        .add(({'market_name': _marketNameController.text}));
    Get.offAll(() => const AddDetailsShop());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Market'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            MyTextfield(
                hintText: 'Enter Market Name',
                obscure: false,
                controller: _marketNameController),
            const SizedBox(
              height: 50,
            ),
            MyButton(
              onPressed: addStore,
              text: 'N E X T',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              backgroundColor: Colors.blueAccent.shade400,
            )
          ],
        ),
      ),
    );
  }
}
