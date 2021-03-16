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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                child: Container(
                  child: Text('Book Library'),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/library');
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  child: Text('Book Store'),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/store');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
