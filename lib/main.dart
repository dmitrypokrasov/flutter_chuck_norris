import 'package:flutter/material.dart';
import 'package:flutterapp/api/ChuckFact.dart';
import 'package:flutterapp/redux/ChuckStore.dart';
import 'package:flutterapp/redux/FlutterReduxApp.dart';
import 'package:flutterapp/redux/Reducers.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<ChuckStore>(getFactReducer,
      initialState: ChuckStore(
          ChuckFact(
              "1",
              "When Chuck Norris was born, he immediately had sex with the first nurse he saw. He was her first. She was his third. That afternoon.",
              []),
          [
            ChuckFact(
                "1",
                "When Chuck Norris was born, he immediately had sex with the first nurse he saw. He was her first. She was his third. That afternoon.",
                [])
          ]));

  runApp(new FlutterReduxApp(
    title: 'Flutter Redux Demo',
    store: store,
  ));
}
