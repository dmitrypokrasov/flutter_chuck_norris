import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterapp/redux/ChuckStore.dart';
import 'package:flutterapp/stateful/MyHomePage.dart';
import 'package:redux/redux.dart';

class FlutterReduxApp extends StatelessWidget {
  final Store<ChuckStore> store;
  final String title;

  FlutterReduxApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<ChuckStore>(
        store: store,
        child: MaterialApp(
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: title),
        ));
  }
}
