import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterapp/redux/Actions.dart';
import 'package:flutterapp/redux/ChuckStore.dart';
import 'package:flutterapp/stateful/MyHomePage.dart';
import 'package:flutterapp/stateless/FactList.dart';
import 'package:flutterapp/stateless/FactRandom.dart';

class MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _onTappedBottomBarElement(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  StoreConnector _getFab() {
    if (_currentIndex == 0) {
      return StoreConnector<ChuckStore, OnGetFactCallBack>(
        converter: (store) {
          return () => store.dispatch(ActionsType.getFact());
        },
        builder: (context, callback) {
          return FloatingActionButton(
            onPressed: callback,
            tooltip: 'New facts',
            child: Icon(Icons.cached),
          );
        },
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
//    if (facts.isEmpty && _currentIndex == 0) {
//      //получить факт если список пуст
//    }

    return StoreConnector<ChuckStore, ChuckStore>(
      converter: (store) => store.state,
      builder: (context, chuckFact) {
        return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: <Widget>[
              FactRandom(chuckFact.fact),
              FactList(chuckFact.facts)
            ][_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onTappedBottomBarElement,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), title: Text("Random fact")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list), title: Text("All facts"))
              ],
            ),
            floatingActionButton: _getFab());
      },
    );
  }
}

typedef OnGetFactCallBack = Function();
