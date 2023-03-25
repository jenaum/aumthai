import 'package:aum_thai_v1/utility/my_images.dart';
import 'package:flutter/material.dart';

class WidgetImages extends StatelessWidget {
  const WidgetImages({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      MyImages.logo,
      width: size,
      height: size,
    );
  }
}
