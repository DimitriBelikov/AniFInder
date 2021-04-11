import 'dart:io';

import 'package:anifinder/constants.dart';
import 'package:anifinder/modelfunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'resultscreen.dart';

class HomePage extends StatefulWidget {
  static String homePageRoute = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image = File('');
  bool _isLoading = false;

  Future pickCropclassify(ImageSource imgSource) async {
    final pickedImage = await ImagePicker().getImage(source: imgSource);

    final croppedImage = await ImageCropper.cropImage(
      sourcePath: pickedImage!.path,
      androidUiSettings: AndroidUiSettings(
        backgroundColor: kackgroundcolor,
        toolbarColor: Colors.grey.shade800,
        toolbarTitle: 'Edit Image',
        toolbarWidgetColor: Colors.orange.shade600,
        lockAspectRatio: false,
      ),
    );
    setState(() {
      _image = File(croppedImage!.path);
      _isLoading = true;
    });
    sleep(Duration(seconds: 2));
    return runModel(_image);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? SpinKitFadingCube(
            color: Colors.tealAccent,
            size: 70.0,
            //duration: Duration(seconds: 10),
          )
        : Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
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
                    onPressed: () async {
                      var _result = await pickCropclassify(ImageSource.gallery);
                      Future.delayed(Duration(seconds: 5), () {
                        Navigator.pushNamed(
                          context,
                          ResultScreen.resultScreenRoute,
                          arguments: ResultArguments(_result, _image),
                        );
                      });
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    child: Text('Click Image From Camera'),
                    style: kuttonStyle,
                    onPressed: () async {
                      var _result = await pickCropclassify(ImageSource.camera);
                      Future.delayed(Duration(seconds: 5), () {
                        Navigator.pushNamed(
                          context,
                          ResultScreen.resultScreenRoute,
                          arguments: ResultArguments(_result, _image),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
            backgroundColor: kackgroundcolor,
          );
  }
}
