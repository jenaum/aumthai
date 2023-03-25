// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:aum_thai_v1/utility/my_colors.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    required this.hint,
    required this.changeFunc,
    this.obsecu,
  }) : super(key: key);

  final String hint;
  final Function(String) changeFunc;
  final bool? obsecu;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(
        obscureText: obsecu ?? false,
        onChanged: changeFunc,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: colorGrey.withOpacity(0.25),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
