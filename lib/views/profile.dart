import 'package:ebuk_app/services/profile.dart';
import 'package:flutter/material.dart';
import 'package:ebuk_app/res/string.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: FutureBuilder(
        future: fetchProfile(email),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Image.network(noProfilePictureLinks),
                  SizedBox(height: 20),
                  Text(
                    "Hi,",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    snapshot.data,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your email is ${email}',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
