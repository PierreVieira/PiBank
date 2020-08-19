import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

void findAll() async {
  final Response response = await get('http://192.168.1.78:8080/transactions');
  debugPrint(response.body);
}