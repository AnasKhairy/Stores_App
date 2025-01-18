import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el_fares/auth/auth_service.dart';
import 'package:el_fares/components/my_card.dart';
import 'package:el_fares/pages/market_search_page.dart';
import 'package:el_fares/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void addMarket() {
    Get.to(() => const MarketSearchPage());
  }

  void signOut() {
    final auth = AuthService();
    auth.signOut();
    Get.offAll(() => const SplashScreenPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: IconButton(
                onPressed: signOut,
                icon: const Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('markets').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading markets'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No markets available'));
          }

          final markets = snapshot.data!.docs;

          return ListView.builder(
            itemCount: markets.length,
            itemBuilder: (context, index) {
              final market = markets[index];
              return FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('markets')
                    .doc(market.id)
                    .collection('stores')
                    .get(),
                builder: (context, AsyncSnapshot<QuerySnapshot> storeSnapshot) {
                  if (storeSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (storeSnapshot.hasError) {
                    return const Center(child: Text('Error loading stores'));
                  }
                  if (!storeSnapshot.hasData ||
                      storeSnapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text('No stores in this market'));
                  }

                  final stores = storeSnapshot.data!.docs;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          market['market_name'] ?? 'Unnamed Market',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...stores.map((store) {
                        return MyCard(
                          shopName: store['shop_name'] ?? 'Unnamed Store',
                          marketName: market['market_name'] ?? 'Unnamed Market',
                          tenantName: store['tenant_name'] ?? 'Unnamed Tenant',
                          tenantNumber:
                              store['tenant_number'] ?? 'Unknown Number',
                          paymentAmount: store['payments_amount'] ?? 'N/A',
                          rentDate: store['rent_date'] ?? 'N/A',
                        );
                      }),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addMarket,
        child: const Icon(Icons.add),
      ),
    );
  }
}
