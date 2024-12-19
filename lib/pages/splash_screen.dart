import 'package:el_fares/components/my_button.dart';
import 'package:el_fares/pages/login_page.dart';
import 'package:el_fares/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  // Login method
  void login() {
    Get.to(() => LoginPage());
  }

  // sign up method
  void signUp() {
    Get.to(() => SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            // Blue Background Container
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.lightBlueAccent,
            ),
            // White Front Card
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: SvgPicture.asset('assets/box_icon.svg'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome to El-Fares App',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Please login to your account or if you don’t have one create it now, so you can look stores and markets.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                      onPressed: login,
                      backgroundColor: Colors.greenAccent,
                      text: 'L O G I N',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      onPressed: signUp,
                      text: 'S I G N U P',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Globe Icon in Top-left
            _changeLanguage(context),
          ],
        ),
      ),
    );
  }

  Positioned _changeLanguage(BuildContext context) {
    return Positioned(
      top: 45,
      left: 20,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xffCDFFB6),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Icon(
            Icons.language,
            color: Colors.black,
            size: MediaQuery.of(context).size.width * 0.08,
          ),
        ),
      ),
    );
  }
}
