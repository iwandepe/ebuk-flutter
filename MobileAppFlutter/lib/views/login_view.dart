import 'package:ebuk_app/widgets/auth_text_form_field.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                "WELCOME",
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
                      labelText: "Email",
                      errorText: "Email tidak boleh kosong",
                    ),
                    AuthTextFormField(
                      labelText: "Password",
                      errorText: "Password tidak boleh kosong",
                    ),
                  ],
                ),
              ),
            ),

            // Flat Button to submit form
            FlatButton(
              child: Text(
                "SIGN IN",
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {},
            ),

            // Expanded to hold question linking to sign up page
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Dont have an account?",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  InkWell(
                    child: Text(
                      "Create new account",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}
