import 'package:ebuk_app/models/book_sell.dart';
import 'package:ebuk_app/services/service_api_crud.dart';
import 'package:ebuk_app/views/widgets/edit_text_form_field.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final BookSell bookSell;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _linkToImageController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  EditPage({this.bookSell});

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
              createBookJson(
                1,
                _titleController.text,
                _authorController.text,
                _categoryController.text,
                _priceController.text,
                _linkToImageController.text,
                _descriptionController.text
              );
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
                initialValue: bookSell.title,
                errorText: 'Title cannot be null',
                labelText: 'Title',
                controller: _titleController,
              ),
            ),
            Expanded(
              child: EditTextFormField(
                initialValue: bookSell.author,
                errorText: 'Author cannot be null',
                labelText: 'Author',
                controller: _authorController,
              ),
            ),
            Expanded(
              child: EditTextFormField(
                initialValue: bookSell.category,
                errorText: 'Category cannot be null',
                labelText: 'Category',
                controller: _categoryController,
              ),
            ),
            Expanded(
              child: EditTextFormField(
                initialValue: bookSell.price,
                errorText: 'Price cannot be null',
                labelText: 'Price',
                controller: _priceController,
              ),
            ),
            Expanded(
              child: EditTextFormField(
                initialValue: bookSell.linkToImage,
                errorText: 'Link to image cannot be null',
                labelText: 'Link to image',
                controller: _linkToImageController,
              ),
            ),
            Expanded(
              child: EditTextFormField(
                initialValue: bookSell.description,
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
