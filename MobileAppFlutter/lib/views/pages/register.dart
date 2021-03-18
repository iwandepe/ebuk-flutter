import 'package:flutter/material.dart';
import 'package:ebuk_app/views/widgets/auth_text_form_field.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scroll View to prevent bottom overflow when the keyboard comes out
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Expanded to hold app logo
            Text(
              "CREATE NEW\nACCOUNT",
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AuthTextFormField(
                    labelText: "Name",
                    errorText: "Name cannot be empty",
                  ),
                  SizedBox(height: 1),
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
            ),

            FlatButton(
              height: 50,
              minWidth: MediaQuery.of(context).size.width * 0.8,
              color: Colors.greenAccent,
              child: Text(
                "REGISTER",
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
