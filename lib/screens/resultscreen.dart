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

class ResultScreen extends StatefulWidget {
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
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AniFinder',
          style: headerStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
            alignment: Alignment.center,
            onPressed: () {},
            splashRadius: 20.0,
          )
        ],
        backgroundColor: Colors.grey.shade800,
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
                    displayText: widget._species,
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
              child: Image.file(widget._image),
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
                  displayText: widget._speciesInfo,
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
    );
  }
}
