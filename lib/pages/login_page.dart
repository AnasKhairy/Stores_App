import 'package:el_fares/components/my_button.dart';
import 'package:el_fares/components/my_textfield.dart';
import 'package:el_fares/pages/home_page.dart';
import 'package:el_fares/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  // email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  // ValueNotifier to manage the password visibility state
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  // ValueNotifier to manage the checkbox for remember me
  final ValueNotifier<bool> _isChecked = ValueNotifier<bool>(false);

  void signUp() {
    Get.to(() => SignUpPage());
  }

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi, Welcome Back! 👋",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Text(
                  "You have been missed",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Email Address"),
                // Email Address
                MyTextfield(
                  hintText: "Enter your email address",
                  obscure: false,
                  controller: _emailController,
                ),
                const Text("Password"),
                ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return MyTextfield(
                      hintText: "Enter your password",
                      obscure: value,
                      controller: _pwController,
                      suffixIcon: IconButton(
                        icon: Icon(
                          value ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // checkbox for remember me
                        ValueListenableBuilder<bool>(
                          valueListenable: _isChecked,
                          builder: (context, value, child) {
                            return Checkbox(
                              value: value,
                              activeColor: Colors.grey.shade400,
                              checkColor: Colors.black,
                              onChanged: (bool? newValue) {
                                _isChecked.value = newValue ?? false;
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('Remember Me'),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text('Forgot Password'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyButton(
                  onPressed: () {
                    Get.to(() => const HomePage());
                  },
                  text: "Sign In",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  backgroundColor: Colors.blueAccent.shade400,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    InkWell(
                      onTap: signUp,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.cyan.shade900),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Or Sign In with',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: SvgPicture.asset('assets/google_icon.svg'),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade200),
                      child: SvgPicture.asset('assets/facebook_icon.svg'),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
