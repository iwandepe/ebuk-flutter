import 'package:flutter/material.dart';

class EditTextFormField extends StatelessWidget {
  final String labelText;
  final String errorText;
  final String initialValue;
  final TextEditingController controller;

  EditTextFormField({
    @required this.labelText,
    @required this.errorText,
    @required this.controller,
    @required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller..text = initialValue,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
