import 'package:el_fares/components/my_button.dart';
import 'package:el_fares/components/my_textfield.dart';
import 'package:el_fares/pages/add_shop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMarket extends StatelessWidget {
  AddMarket({super.key});

  final TextEditingController _marketNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Market'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            MyTextfield(
                hintText: 'Enter Name Market',
                obscure: false,
                controller: _marketNameController),
            SizedBox(
              height: 50,
            ),
            MyButton(
              onPressed: goTo,
              text: 'N E X T',
              style: TextStyle(
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

  void goTo() {
    Get.to(() => AddShop());
  }
}
