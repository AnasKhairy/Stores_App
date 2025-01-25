import 'package:flutter/material.dart';

class MarketCard extends StatelessWidget {
  final String marketName;
  final String numOfShops;
  final String numOfAvailableShops;
  final String numOfUnavailableShops;
  //we need add logo if it exists

  const MarketCard(
      {super.key,
      required this.marketName,
      required this.numOfShops,
      required this.numOfAvailableShops,
      required this.numOfUnavailableShops});

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
                          '${marketName}Market',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045, // Dynamic font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height: screenWidth * 0.01), // Adaptive spacing

                        Text(
                          'Num of Shops:${numOfShops}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.blueGrey.shade500,
                          ),
                        ),
                        SizedBox(
                            height: screenWidth * 0.01), // Adaptive spacing
                        Row(
                          children: [
                            // SizedBox(
                            //   width: screenWidth * 0.01, // Dynamic spacing
                            // ),
                            Text(
                              'Available Shops: ${numOfAvailableShops}',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.blueGrey.shade500,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.02, // Dynamic spacing
                            ),
                            Text(
                              'UnAvailable Shops: ${numOfUnavailableShops}',
                              style: TextStyle(
                                fontSize: screenWidth * 0.035,
                                color: Colors.blueGrey.shade500,
                              ),
                            )
                          ],
                        ),
                      ],
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
