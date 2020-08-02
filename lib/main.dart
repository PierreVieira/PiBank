import 'package:flutter/material.dart';

void main() {
  runApp(PiBank());
}

class PiBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('PiBank'),
        ),
        body: Column(
          children: <Widget>[
            Image.asset('images/pi_bank_logo.jpg'),
            Container(
              height: 120,
              width: 100,
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Icon(Icons.people),
                  Text('Contacts')
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
