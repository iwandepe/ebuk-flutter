import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final String content;

  MenuWidget({this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      color: Colors.greenAccent,
      child: AspectRatio(
        aspectRatio: 1,
        child: Center(
            child: Text(
          content,
          style: Theme.of(context).textTheme.overline,
        ),),
      ),
    );
  }
}
