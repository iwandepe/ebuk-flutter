import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final String labelText;
  final String errorText;
  final TextEditingController controller;

  AuthTextFormField({
    @required this.labelText,
    @required this.errorText,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      width: MediaQuery.of(context).size.width * 0.8,
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
