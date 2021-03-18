import 'package:flutter/material.dart';
import 'package:ebuk_app/services/service_api_crud.dart';
import 'package:ebuk_app/views/widgets/edit_text_form_field.dart';
import 'package:image_picker/image_picker.dart';

import 'package:async/async.dart';
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
  var linkToImage = '';

  static final String uploadEndPoint =
      'http://iwandepee.000webhostapp.com/ebuk/api/upload_image.php';
  Future<File> file;
  String base64Image;
  File tmpFile;

  chooseImage() {
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
    // var stream = http.ByteStream(DelegatingStream.typed(tmpFile.openRead()));
    // var length = await tmpFile.length();
    // var request = new http.MultipartRequest("POST", Uri.parse(uploadEndPoint));
    // request.fields['name'] = fileName;
    // request.files.add(await http.MultipartFile(
    //     'picture',
    //     stream,
    //     length,
    //     filename: fileName
    // ));
    // request.send().then((response) {
    //   if (response.statusCode == 200) print(response);
    // });
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
                  FlatButton(
                    onPressed: chooseImage,
                    child: Text("Choose Image"),
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
