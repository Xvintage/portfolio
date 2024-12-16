import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const SquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Image.asset(
          imagePath,
          height: 72,
        ),
      ),
    );
    //
  }
}
