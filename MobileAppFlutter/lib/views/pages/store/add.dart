import 'package:flutter/material.dart';
import 'package:ebuk_app/services/service_api_crud.dart';
import 'package:ebuk_app/views/widgets/edit_text_form_field.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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
        title: Text('Add Book'),
        leading: IconButton(
          icon: Icon(Icons.cancel_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check_circle_outline),
            onPressed: () {
              Future.delayed(Duration.zero, () async {
                addBook(
                        1,
                        _titleController.text,
                        _authorController.text,
                        _categoryController.text,
                        _priceController.text,
                        _linkToImageController.text,
                        _descriptionController.text)
                    .then((value) => Navigator.pop(context));
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                EditTextFormField(
                  initialValue: '',
                  errorText: 'Title cannot be null',
                  labelText: 'Title',
                  controller: _titleController,
                ),
                EditTextFormField(
                  initialValue: '',
                  errorText: 'Author cannot be null',
                  labelText: 'Author',
                  controller: _authorController,
                ),
                EditTextFormField(
                  initialValue: '',
                  errorText: 'Category cannot be null',
                  labelText: 'Category',
                  controller: _categoryController,
                ),
                EditTextFormField(
                  initialValue: '',
                  errorText: 'Price cannot be null',
                  labelText: 'Price',
                  controller: _priceController,
                ),
                EditTextFormField(
                  initialValue: '',
                  errorText: 'Link to image cannot be null',
                  labelText: 'Link to image',
                  controller: _linkToImageController,
                ),
                EditTextFormField(
                  initialValue: '',
                  errorText: 'Description cannot be null',
                  labelText: 'Description',
                  controller: _descriptionController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
