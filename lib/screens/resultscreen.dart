import 'dart:io';

import 'package:anifinder/constants.dart';
import 'package:anifinder/modelfunctions.dart';
import 'package:anifinder/reusablewidget.dart';
import 'package:flutter/material.dart';

class ResultArguments {
  List result;
  File image;
  ResultArguments(this.result, this.image);
}

class ResultScreen extends StatelessWidget {
  static String resultScreenRoute = '/results';
  ModelLabels modelLabel = ModelLabels();

  late List _resultData;
  late File _image;
  late String _species, _speciesInfo;

  ResultScreen(List resultData, File image) {
    _resultData = resultData;
    _image = image;
    _species = _resultData[0]['label'].toUpperCase();
    _speciesInfo = modelLabel.getAnimalInfo(_species);
    print(_speciesInfo);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'AniFinder',
            style: headerStyle,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
            splashRadius: 20.0,
          ),
          backgroundColor: Colors.grey.shade800,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: ReusableText(
                  displayText: "It's a",
                  textStyle: kextStyleheader,
                  alignment: TextAlign.center),
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
            ),
            Container(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ReusableText(
                      displayText: _species,
                      textStyle: kextStyleheader,
                      alignment: TextAlign.center)),
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.lightBlue.shade400,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Image.file(_image),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
                height: 70.0,
              ),
            ),
            Container(
              child: ReusableText(
                  displayText: "Animal Information",
                  textStyle: kextStyledata,
                  alignment: TextAlign.center),
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: ReusableText(
                    displayText: _speciesInfo,
                    textStyle: kextStyleInfo,
                    alignment: TextAlign.justify),
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
        backgroundColor: kackgroundcolor,
      ),
    );
  }
}
