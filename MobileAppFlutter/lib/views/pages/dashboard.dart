import 'package:ebuk_app/views/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: MenuWidget(content: 'Books Library',),
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
      ),
    );
  }
}
