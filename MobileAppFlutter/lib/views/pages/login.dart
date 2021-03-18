import 'package:ebuk_app/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:ebuk_app/views/widgets/auth_text_form_field.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                    // Form(
                    //   key: _formKey,
                    //   child:
                    Column(
                      children: [
                        AuthTextFormField(
                          labelText: "Email",
                          errorText: "Email cannot be empty",
                          controller: _emailController,
                        ),
                        SizedBox(height: 1),
                        AuthTextFormField(
                          labelText: "Password",
                          errorText: "Password cannot be empty",
                          controller: _passwordController,
                        ),
                      ],
                    ),
                    // ),

                    FlatButton(
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.greenAccent,
                      child: Text(
                        "SIGN IN",
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: () {
                        login(context, _emailController.text, _passwordController.text);
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
