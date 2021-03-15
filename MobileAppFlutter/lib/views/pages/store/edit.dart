import 'package:ebuk_app/views/widgets/edit_text_form_field.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _linkToImageController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Book\'s data'),
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: EditTextFormField(
                errorText: 'Title cannot be null',
                labelText: 'Title',
                controller: _titleController,
              ),
            ),
            Expanded(
              child: EditTextFormField(
                errorText: 'Author cannot be null',
                labelText: 'Author',
                controller: _authorController,
              ),
            ),
            Expanded(
              child: EditTextFormField(
                errorText: 'Category cannot be null',
                labelText: 'Category',
                controller: _categoryController,
              ),
            ),
            Expanded(
              child: EditTextFormField(
                errorText: 'Link to image cannot be null',
                labelText: 'Link to image',
                controller: _linkToImageController,
              ),
            ),
            Expanded(
              child: EditTextFormField(
                errorText: 'Description cannot be null',
                labelText: 'Description',
                controller: _descriptionController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
