import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_acess/filters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:path/path.dart';
import 'photo_filtered.dart';

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

  Future getGalleryImage(context,String typeSelect) async {
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
          filters: typeSelect == "s" 
          ? simulateBlindnessFilters 
          : correctionBlindnessFilters,
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

  Future getCameraImage(context,String typeSelect) async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    fileName = basename(imageFile.path);
    var image = imageLib.decodeImage(imageFile.readAsBytesSync());
    image = imageLib.copyResize(image, width: 300);
    Map imagefile = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new PhotoFilterSelector(
          title: Text("Photo Filter Example"),
          image: image,
          filters: typeSelect == "s" 
          ? simulateBlindnessFilters 
          : correctionBlindnessFilters,
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

  Future<void> _showSimulationChoiceDialg(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Make a choice",
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                GestureDetector(
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: Container(
                        height: 40.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width -
                                  (MediaQuery.of(context).size.width - 85),
                              vertical: 10.0),
                          child: Text("Gallery"),
                        ),
                      ),
                    ),
                    onTap: () {
                      getGalleryImage(context,"s");
                    }),
                GestureDetector(
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: Container(
                        height: 40.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width -
                                  (MediaQuery.of(context).size.width - 85),
                              vertical: 10.0),
                          child: Text("Camera"),
                        ),
                      ),
                    ),
                    onTap: () {
                      getCameraImage(context,"s");
                    }),
              ],
            )),
          );
        });
  }

  Future<void> _showCorrectionChoiceDialg(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Make a choice",
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                GestureDetector(
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: Container(
                        height: 40.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width -
                                  (MediaQuery.of(context).size.width - 85),
                              vertical: 10.0),
                          child: Text("Gallery"),
                        ),
                      ),
                    ),
                    onTap: () {
                      getGalleryImage(context,"c");
                    }),
                GestureDetector(
                    child: Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: Container(
                        height: 40.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width -
                                  (MediaQuery.of(context).size.width - 85),
                              vertical: 10.0),
                          child: Text("Camera"),
                        ),
                      ),
                    ),
                    onTap: () {
                      getCameraImage(context,"c");
                    }),
              ],
            )),
          );
        });
  }

  Widget _decideImageView(context) {
    if (imageFile == null) {
      log('image: Null');
      return Text("No image selected");
    } else {
      log('image: No null');
      return Image.file(imageFile,
          width: MediaQuery.of(context).size.width, height: 400);
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
                _decideImageView(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 25),),
                    RaisedButton(
                      child: Text("Simulate"),
                      onPressed: () {
                        _showSimulationChoiceDialg(context);
                      },
                    ),
                    
                    RaisedButton(
                      child: Text("Correction"),
                      onPressed: () {
                        _showCorrectionChoiceDialg(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 25),),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
