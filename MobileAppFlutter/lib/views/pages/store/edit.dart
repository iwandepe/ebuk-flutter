import 'package:ebuk_app/models/book_sell.dart';
import 'package:ebuk_app/services/service_api_crud.dart';
import 'package:ebuk_app/views/widgets/edit_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditPage extends StatefulWidget {
  final BookSell bookSell;

  EditPage({this.bookSell});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController;
  TextEditingController _authorController;
  TextEditingController _categoryController;
  TextEditingController _priceController;
  TextEditingController _descriptionController;

  var linkToImage;

  static final String uploadEndPoint =
      'http://iwandepee.000webhostapp.com/ebuk/api/upload_image.php';
  Future<File> file;
  String base64Image;
  File tmpFile;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.bookSell.title);
    _authorController = TextEditingController(text: widget.bookSell.author);
    _categoryController = TextEditingController(text: widget.bookSell.category);
    _priceController = TextEditingController(text: widget.bookSell.price);
    _descriptionController =
        TextEditingController(text: widget.bookSell.description);
    linkToImage = widget.bookSell.linkToImage;
  }

  changeImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  startUpload() {
    if (tmpFile == null) {
      print("tmpFile Null");
      return;
    }
    String fileName = tmpFile.path.split('/').last;
    linkToImage = 'http://iwandepee.000webhostapp.com/ebuk/api/${fileName}';
    print(linkToImage);
    upload(fileName);
  }

  upload(String fileName) async {
    http.post(uploadEndPoint, body: {
      'image': base64Image,
      'name': fileName,
    }).catchError((error) {
      print("error");
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Image.file(
            snapshot.data,
            fit: BoxFit.fill,
          );
        } else if (tmpFile == null) {
          return Image.network(
            widget.bookSell.linkToImage,
            fit: BoxFit.fill,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Book\'s data'),
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
                createBookJson(
                        widget.bookSell.id,
                        _titleController.text,
                        _authorController.text,
                        _categoryController.text,
                        _priceController.text,
                        linkToImage,
                        _descriptionController.text)
                    .then((value) => Navigator.pop(context));
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Form(
              key: _formKey,
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
                    initialValue: widget.bookSell.description,
                    errorText: 'Description cannot be null',
                    labelText: 'Description',
                    controller: _descriptionController,
                  ),
                  FlatButton(
                    onPressed: changeImage,
                    child: Text("Change Image"),
                  ),
                  showImage(),
                  FlatButton(
                    onPressed: startUpload,
                    child: Text('Upload Image'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
