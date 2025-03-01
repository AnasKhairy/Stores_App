import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final TextStyle style;
  final Color? backgroundColor;
  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.style,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shadowColor: Colors.black54,
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.85,
          50,
        ), // Width is 85% of screen, height is 50
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
