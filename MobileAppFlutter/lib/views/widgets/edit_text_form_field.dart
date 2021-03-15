import 'package:flutter/material.dart';

class EditTextFormField extends StatelessWidget {
  final String labelText;
  final String errorText;
  final TextEditingController controller;

  EditTextFormField({@required this.labelText, @required this.errorText, @required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}