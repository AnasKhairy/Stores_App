import 'package:el_fares/auth/auth_service.dart';
import 'package:el_fares/components/my_card.dart';
import 'package:el_fares/pages/add_market.dart';
import 'package:el_fares/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void addMarket() {
    Get.to(() => AddMarket());
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const MyCard();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addMarket,
        child: const Icon(Icons.add),
      ),
    );
  }
}
