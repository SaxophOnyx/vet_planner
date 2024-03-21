import 'package:flutter/material.dart';

class MedicalKitAppBarSwitcher extends StatelessWidget {
  const MedicalKitAppBarSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
