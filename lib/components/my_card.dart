import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCard extends StatelessWidget {
  final String shopName;
  final String marketName;
  final String tenantName;
  final String tenantNumber;
  final String paymentAmount;
  final Timestamp? rentDate;

  const MyCard({
    super.key,
    required this.shopName,
    required this.marketName,
    required this.tenantName,
    required this.tenantNumber,
    required this.paymentAmount,
    required this.rentDate,
  });

  String formatDate(Timestamp? timestamp) {
    if (timestamp == null) return 'No date provided';
    DateTime dateTime = timestamp.toDate();
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use constraints to determine the available width
        double screenWidth = constraints.maxWidth;

        return Card(
          color: const Color(0xffC8E3F6),
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03, // Adaptive horizontal margin
            vertical: 8.0, // Fixed vertical margin
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // Adaptive padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Section: Icon and Text
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Circle Icon Container
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.photo,
                        size: screenWidth * 0.08, // Icon size based on width
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03, // Dynamic spacing
                    ),
                    // Text Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shopName,
                          style: TextStyle(
                            fontSize: screenWidth * 0.045, // Dynamic font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height: screenWidth * 0.01), // Adaptive spacing
                        Text(
                          marketName,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.blueGrey.shade500,
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.01),
                        Row(
                          children: [
                            Text(
                              tenantName,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.blueGrey.shade500,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.02, // Dynamic spacing
                            ),
                            Text(
                              tenantNumber,
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.blueGrey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // Right Section: Payment and Rent Date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      paymentAmount,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.01), // Adaptive spacing
                    Text(
                      formatDate(rentDate),
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.blueGrey.shade500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
