import 'package:flutter/material.dart';
import 'package:ebuk_app/widgets/auth_text_form_field.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scroll View to prevent bottom overflow when the keyboard comes out
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.075),

          // Expanded to hold app logo
          Expanded(
            child: Text(
              "ebuk",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),

          // Expanded to hold welcome text
          Expanded(
            child: Text(
              "REGISTER",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),

          // Expanded to hold log in process widgets
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  AuthTextFormField(
                    labelText: "Name",
                    errorText: "Name cannot be empty",
                  ),
                  AuthTextFormField(
                    labelText: "Email",
                    errorText: "Email cannot be empty",
                  ),
                  AuthTextFormField(
                    labelText: "Password",
                    errorText: "Password cannot be empty",
                  ),
                ],
              ),
            ),
          ),

          // Flat Button to submit form
          FlatButton(
            child: Text(
              "REGISTER",
              style: Theme.of(context).textTheme.button,
            ),
            onPressed: () {},
          ),

          // Expanded to hold question linking to sign up page
          Expanded(
            child: Column(
              children: [
                Text(
                  "Already have an account?",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                InkWell(
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  onTap: () {
                    
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}