// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aum_thai_v1/utility/my_colors.dart';
import 'package:aum_thai_v1/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  const WidgetButton({
    Key? key,
    required this.ladel,
    required this.pressFunc,
  }) : super(key: key);

  final String ladel;
  final Function() pressFunc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressFunc,
      child: WidgetText(data: ladel),
      style: ElevatedButton.styleFrom(
          backgroundColor: colorBlueDark, foregroundColor: Colors.white),
    );
  }
}
