import 'package:flutter/material.dart'
    show
        AlertDialog,
        AppBar,
        BuildContext,
        Center,
        Colors,
        EdgeInsets,
        FloatingActionButton,
        GestureDetector,
        Icon,
        Icons,
        Image,
        Key,
        ListBody,
        Padding,
        Scaffold,
        SingleChildScrollView,
        StadiumBorder,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget,
        showDialog;
import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource;
import 'dart:io';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File _image;
  final _picker = ImagePicker();
  // File _imageGallery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Camera App'),
      ),
      body: Center(
        child: _image == null ? Text("No Image") : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _optionDialogBox,
        child: Icon(Icons.add_a_photo),
        tooltip: 'Open Camera',
      ),
    );
  }

  Future<void> _optionDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            shape: StadiumBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Take a Picture',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: openCamera,
                  ),
                  Padding(padding: EdgeInsets.all(20.0)),
                  GestureDetector(
                    child: Text(
                      'Take a Picture form Gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future openCamera() async {
    var image = await _picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = image as File;
    });
  }

  Future openGallery() async {
    var picture = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = picture as File;
    });
  }
}
