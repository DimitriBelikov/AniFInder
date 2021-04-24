import 'dart:io';

import 'package:anifinder/constants.dart';
import 'package:anifinder/modelfunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'resultscreen.dart';

class HomePage extends StatefulWidget {
  static String homePageRoute = '/';
  File _image = File('');
  bool _isLoading = false;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future pickImage(ImageSource imgSource) async {
    return await ImagePicker().getImage(source: imgSource);
  }

  Future cropImage(PickedFile pickedImage) async {
    final croppedImage = await ImageCropper.cropImage(
      sourcePath: pickedImage.path,
      androidUiSettings: AndroidUiSettings(
        backgroundColor: kackgroundcolor,
        toolbarColor: Colors.grey.shade800,
        toolbarTitle: 'Edit Image',
        toolbarWidgetColor: Colors.orange.shade600,
        lockAspectRatio: false,
      ),
    );
    return croppedImage;
  }

  Future classifyImage(ImageSource imgSource) async {
    var pickedImage = await pickImage(imgSource);
    var croppedImage = await cropImage(pickedImage);
    setState(() {
      widget._image = File(croppedImage!.path);
      widget._isLoading = true;
    });
    //sleep(Duration(seconds: 1));
    return runModel(widget._image);
  }

  onPressedFunction(ImageSource imgSource) async {
    var _result = await classifyImage(imgSource);
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(
        context,
        ResultScreen.resultScreenRoute,
        arguments: ResultArguments(_result, widget._image),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Building Homepage');
    return widget._isLoading == true
        ? const SpinKitFadingCube(
            color: Colors.tealAccent,
            size: 70.0,
          )
        : Scaffold(
            appBar: AppBar(
              title: Center(
                child: const Text(
                  'AniFinder',
                  style: headerStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              backgroundColor: Colors.grey.shade800,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Select Image From Gallery'),
                    style: kuttonStyle,
                    onPressed: () {
                      onPressedFunction(ImageSource.gallery);
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    child: Text('Click Image From Camera'),
                    style: kuttonStyle,
                    onPressed: () {
                      onPressedFunction(ImageSource.camera);
                    },
                  ),
                ],
              ),
            ),
            backgroundColor: kackgroundcolor,
          );
  }
}
