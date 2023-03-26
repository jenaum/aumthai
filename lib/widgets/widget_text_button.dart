// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aum_thai_v1/widgets/widget_text.dart';
import 'package:flutter/material.dart';

class WidgetTextButton extends StatelessWidget {
  const WidgetTextButton({
    Key? key,
    required this.ladel,
    required this.pressFunc,
  }) : super(key: key);

  final String ladel;
  final Function() pressFunc;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: pressFunc, child: WidgetText(data: ladel));
  }
}
