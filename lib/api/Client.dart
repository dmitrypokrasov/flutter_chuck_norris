import 'package:flutter/material.dart';
import 'package:flutterapp/api/ChuckFact.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart';

const url = "http://api.icndb.com/jokes/random";
const int CODE_SUCCESSFUL = 200;

Future<ChuckFact> getFact() => http.get(url).then((response) {
      if (response.statusCode == CODE_SUCCESSFUL) {
        var jsonResponse = convert.jsonDecode(response.body);

        Map body = jsonResponse['value'];
        return ChuckFact(
            body['id'].toString(), body['joke'], body['categories']);
      }
      return null;
    }).catchError((error) {
      Fluttertoast.showToast(
          msg: "Проверьте соединение с сетью",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black54,
          textColor: Colors.white);
    });

void openLink() async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    Fluttertoast.showToast(
        msg: "Проверьте соединение с сетью",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black54,
        textColor: Colors.white);
  }
}
