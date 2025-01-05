import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoreInfo extends StatefulWidget {
  const MoreInfo({super.key});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {

  String? _rentalPeriodController;
  DateTime? selectedDate;
  DateTime? dueDate;

  final TextEditingController _numberOfPaymentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('More Info'),),
      body: Column(
        children: [
          SizedBox(height: 20),
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
          DropdownButton<String>(
            hint: Text('Select Rental Poriod'),

            value: _rentalPeriodController,
            items: <String>['monthly', 'yearly']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _rentalPeriodController = newValue;
              });
            },
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                selectedDate == null
                    ? 'Add Rent Date'
                    : '$selectedDate'.split(' ')[0],
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                dueDate == null
                    ? 'Add due Date'
                    : '$dueDate'.split(' ')[0],
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),

        ],
      ),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
