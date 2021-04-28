import 'package:flutter/material.dart';
import 'package:ebuk_app/services/crud_api.dart';
import 'package:ebuk_app/views/store/form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  TextEditingController _descriptionController = TextEditingController();

  String linkToImage = '';
  bool isImageChoosed = false;
  bool isImageUploaded = true;

  static final String uploadEndPoint =
      'http://192.168.64.1/ebuk/api/upload_image.php';
  Future<File> file;
  String base64Image;
  File tmpFile;

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
      isImageChoosed = true;
      isImageUploaded = false;
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
      setState(() {
        isImageUploaded = true;
      });
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
        } else {
          return Text('No Image Selected');
        }
      },
    );
  }

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
                    errorText: 'Description cannot be null',
                    labelText: 'Description',
                    controller: _descriptionController,
                  ),
                  SizedBox(height: 20),
                  isImageChoosed
                      ? SizedBox()
                      : TextButton(
                          onPressed: chooseImage,
                          child: Text("Choose Image"),
                        ),
                  isImageUploaded
                      ? SizedBox()
                      : TextButton(
                          onPressed: startUpload,
                          child: Text('Upload Image'),
                        ),
                  showImage(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
