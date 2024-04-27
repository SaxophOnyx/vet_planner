import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.amber,
      ),
      child: ColoredBox(
        color: Colors.amber,
      ),
    );
  }
}
