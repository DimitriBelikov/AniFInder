import 'package:anifinder/constants.dart';
import 'package:anifinder/reusablewidget.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
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
                    displayText: 'Animal Species',
                    textStyle: kextStyleheader,
                    alignment: TextAlign.center)),
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.lightBlue.shade400,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Image.asset('sample.jpg'),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
              height: 100.0,
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
            child: SingleChildScrollView(
              child: ReusableText(
                  displayText: animalInfo,
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
