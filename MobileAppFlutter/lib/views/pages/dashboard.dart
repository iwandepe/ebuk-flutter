import 'package:ebuk_app/models/profile_args.dart';
import 'package:ebuk_app/views/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProfileArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: MenuWidget(
                content: 'Books Library',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/library');
              },
            ),
            InkWell(
              child: MenuWidget(content: 'Books Store'),
              onTap: () {
                Navigator.pushNamed(context, '/store');
              },
            ),
            InkWell(
              child: MenuWidget(content: 'Your Profil'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/profil',
                  arguments: ProfileArguments(
                    email: args.email,
                    password: args.password,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
