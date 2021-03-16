import 'package:flutter/material.dart';
import 'package:ebuk_app/views/widgets/auth_text_form_field.dart';

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
      body: Container(
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Expanded to hold app logo
              Text(
                "ebuk",
                style: Theme.of(context).textTheme.headline1,
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Expanded to hold welcome text
                    Text(
                      "WELCOME",
                      style: Theme.of(context).textTheme.headline4,
                    ),

                    Column(
                      children: [
                        AuthTextFormField(
                          labelText: "Email",
                          errorText: "Email cannot be empty",
                        ),
                        SizedBox(height: 1),
                        AuthTextFormField(
                          labelText: "Password",
                          errorText: "Password cannot be empty",
                        ),
                      ],
                    ),

                    FlatButton(
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.greenAccent,
                      child: Text(
                        "SIGN IN",
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/dashboard');
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Expanded to hold question linking to sign up page
              Column(
                children: [
                  Text(
                    "Dont have an account?",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  InkWell(
                    child: Text(
                      "Create new account",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
