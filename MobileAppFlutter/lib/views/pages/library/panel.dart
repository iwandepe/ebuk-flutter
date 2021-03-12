import 'package:ebuk_app/services/service_api.dart';
import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: getBookIds(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return GridView.count(
          crossAxisCount: 3,
          children: snapshot.data
          .map((data) => Text(data)).toList(),
        );
      },
    );
  }
}
