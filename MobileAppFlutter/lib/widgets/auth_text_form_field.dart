import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final String labelText;
  final String errorText;

  AuthTextFormField({@required this.labelText, @required this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
      ),
    );
  }
}
