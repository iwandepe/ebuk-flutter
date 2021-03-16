import 'package:flutter/material.dart';

class EditTextFormField extends StatefulWidget {
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
  _EditTextFormFieldState createState() => _EditTextFormFieldState();
}

class _EditTextFormFieldState extends State<EditTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        labelText: widget.labelText,
      ),
    );
  }
}
