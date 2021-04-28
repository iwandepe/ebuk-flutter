import 'package:ebuk_app/views/menu_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
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
              ],
            ),
            InkWell(
              child: MenuWidget(content: 'Your Profil'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/profil',
                  arguments: email,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
