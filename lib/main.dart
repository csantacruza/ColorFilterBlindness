import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_acess/filters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:path/path.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  File imageFile;
  String fileName;
  List<Filter> filters = blindnessFilters;

  Future getGalleryImage(context) async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    fileName = basename(imageFile.path);
    var image = imageLib.decodeImage(imageFile.readAsBytesSync());
    image = imageLib.copyResize(image, width: 400);
    Map imagefile = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new PhotoFilterSelector(
          title: Text("Photo Filter Example"),
          image: image,
          filters: blindnessFilters,
          filename: fileName,
          loader: Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      ),
    );
    if (imagefile != null && imagefile.containsKey('image_filtered')) {
      setState(() {
        imageFile = imagefile['image_filtered'];
        Navigator.of(context).pop();
      });
      print(imageFile.path);
    }
  }
  Future getCameraImage(context) async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    fileName = basename(imageFile.path);
    var image = imageLib.decodeImage(imageFile.readAsBytesSync());
    image = imageLib.copyResize(image, width: 400);
    Map imagefile = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new PhotoFilterSelector(
          title: Text("Photo Filter Example"),
          image: image,
          filters: blindnessFilters,
          filename: fileName,
          loader: Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      ),
    );
    if (imagefile != null && imagefile.containsKey('image_filtered')) {
      setState(() {
        imageFile = imagefile['image_filtered'];
        Navigator.of(context).pop();
      });
      print(imageFile.path);
    }
  }

  // _openGallery(BuildContext context) async {
  //   var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     imageFile = picture;
  //     Navigator.of(context).pop();
  //   });
  // }

  // _openCamera(BuildContext context) async {
  //   var picture = await ImagePicker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     imageFile = picture;
  //     Navigator.of(context).pop();
  //   });
  // }

  Future<void> _showChoiceDialg(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a choice"),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {       
                      //_openGallery(context);
                      getGalleryImage(context);
                    }),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      getCameraImage(context);
                     // _openCamera(context);
                    }),
              ],
            )),
          );
        });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      log('image: Null');
      return Text("No image selected");
    } else {
      log('image: No null');
      return Image.file(imageFile, width: 400, height: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Main Page")),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _decideImageView(),
                RaisedButton(
                  child: Text("Select image"),
                  onPressed: () {
                    _showChoiceDialg(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
