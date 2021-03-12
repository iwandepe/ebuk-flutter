import 'package:ebuk_app/viewmodel/library_view_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Panel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LibraryViewModel>(
      builder: (context, child, model) {
        return InkWell(
          child: Text(
            model.param,
          ),
          onTap: () {
            model.saveData();
          },
        );
      },
    );
  }
}