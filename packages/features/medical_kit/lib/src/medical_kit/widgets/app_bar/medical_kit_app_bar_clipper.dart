import 'package:flutter/material.dart';

class MedicalKitAppBarClipper extends CustomClipper<Path> {
  const MedicalKitAppBarClipper();
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;

    final Path path = Path();
    final Path path2 = Path();

    path.addRect(Rect.fromLTWH(0, 0, width, height));

    path2.addOval(
      Rect.fromCircle(center: Offset(width / 2, height), radius: 25),
    );

    return Path.combine(
      PathOperation.difference,
      path,
      path2,
    );
  }

  @override
  // TODO(SaxophOnyx): Replace with false
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
