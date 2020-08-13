import 'package:flutter/material.dart';
import 'package:pibank/models/contact.dart';
import 'database/app_database.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(PiBank());
  save(Contact(0, 'alex', 1000)).then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}

class PiBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF030660),
          accentColor: Color(0xFF212485),
          buttonTheme: ButtonThemeData(
            buttonColor: Color(0xFF030660),
            textTheme: ButtonTextTheme.primary,
          )),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
