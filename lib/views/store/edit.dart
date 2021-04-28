import 'package:ebuk_app/models/my_book.dart';
import 'package:ebuk_app/services/crud_api.dart';
import 'package:ebuk_app/views/store/form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditPage extends StatefulWidget {
  final MyBook myBook;

  EditPage({this.myBook});

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
      'http://192.168.64.1/ebuk/api/upload_image.php';
  Future<File> file;
  String base64Image;
  File tmpFile;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.myBook.title);
    _authorController = TextEditingController(text: widget.myBook.author);
    _categoryController = TextEditingController(text: widget.myBook.category);
    _priceController = TextEditingController(text: widget.myBook.price);
    _descriptionController =
        TextEditingController(text: widget.myBook.description);
    linkToImage = widget.myBook.linkToImage;
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
    linkToImage = 'http://192.168.64.1/ebuk/api/${fileName}';
    print(linkToImage);
    upload(fileName);
  }

  upload(String fileName) async {
    var response = await http.post(uploadEndPoint, body: {
      'image': base64Image,
      'name': fileName,
    }).catchError((error) {
      print("error");
    });

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(response.body),
            backgroundColor: Color(0xFFE5E5E5),
            actions: <Widget>[
              TextButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      print(response.statusCode);
    }
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
            widget.myBook.linkToImage,
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
                        widget.myBook.id,
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
                    initialValue: widget.myBook.title,
                    errorText: 'Title cannot be null',
                    labelText: 'Title',
                    controller: _titleController,
                  ),
                  EditTextFormField(
                    initialValue: widget.myBook.author,
                    errorText: 'Author cannot be null',
                    labelText: 'Author',
                    controller: _authorController,
                  ),
                  EditTextFormField(
                    initialValue: widget.myBook.category,
                    errorText: 'Category cannot be null',
                    labelText: 'Category',
                    controller: _categoryController,
                  ),
                  EditTextFormField(
                    initialValue: widget.myBook.price,
                    errorText: 'Price cannot be null',
                    labelText: 'Price',
                    controller: _priceController,
                  ),
                  EditTextFormField(
                    initialValue: widget.myBook.description,
                    errorText: 'Description cannot be null',
                    labelText: 'Description',
                    controller: _descriptionController,
                  ),
                  TextButton(
                    onPressed: changeImage,
                    child: Text("Change Image"),
                  ),
                  showImage(),
                  TextButton(
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
