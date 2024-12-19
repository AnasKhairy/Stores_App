import 'package:el_fares/components/my_button.dart';
import 'package:el_fares/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatelessWidget {
  // email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  // ValueNotifier to manage the password visibility state
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
                  "Create Account",
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
                const Text("Confirm your Password"),
                ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return MyTextfield(
                      hintText: "Re enter your password",
                      obscure: value,
                      controller: _confirmPwController,
                    );
                  },
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
                  onPressed: () {},
                  text: "Create An Account.",
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
                      onTap: () {},
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
                  'Or Sign Up with',
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
