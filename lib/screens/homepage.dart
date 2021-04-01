import 'package:anifinder/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: () {
                Navigator.pushNamed(context, '/results');
              },
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
              child: Text('Click Image From Camera'),
              style: kuttonStyle,
              onPressed: () {},
            )
          ],
        ),
      ),
      backgroundColor: kackgroundcolor,
    );
  }
}
