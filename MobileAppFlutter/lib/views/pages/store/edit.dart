import 'package:ebuk_app/models/book_sell.dart';
import 'package:ebuk_app/services/service_api_crud.dart';
import 'package:ebuk_app/views/widgets/edit_text_form_field.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final BookSell bookSell;

  EditPage({this.bookSell});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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
          icon: Icon(Icons.cancel_outlined),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check_circle_outline),
            onPressed: () {
              Future.delayed(Duration.zero, () async {
                createBookJson(
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
          child: Column(
            children: [
              EditTextFormField(
                initialValue: widget.bookSell.title,
                errorText: 'Title cannot be null',
                labelText: 'Title',
                controller: _titleController,
              ),
              EditTextFormField(
                initialValue: widget.bookSell.author,
                errorText: 'Author cannot be null',
                labelText: 'Author',
                controller: _authorController,
              ),
              EditTextFormField(
                initialValue: widget.bookSell.category,
                errorText: 'Category cannot be null',
                labelText: 'Category',
                controller: _categoryController,
              ),
              EditTextFormField(
                initialValue: widget.bookSell.price,
                errorText: 'Price cannot be null',
                labelText: 'Price',
                controller: _priceController,
              ),
              EditTextFormField(
                initialValue: widget.bookSell.linkToImage,
                errorText: 'Link to image cannot be null',
                labelText: 'Link to image',
                controller: _linkToImageController,
              ),
              EditTextFormField(
                initialValue: widget.bookSell.description,
                errorText: 'Description cannot be null',
                labelText: 'Description',
                controller: _descriptionController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
