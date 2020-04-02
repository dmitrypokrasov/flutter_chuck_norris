import 'package:flutter/material.dart';
import 'package:flutterapp/api/ChuckFact.dart';
import 'package:flutterapp/api/Client.dart' as client;

class FactRandom extends StatelessWidget {
  final ChuckFact _fact;

  FactRandom(this._fact);

  String _getFact() {
    if (_fact == null) {
      return 'place for fact';
    } else {
      return _fact.fact;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Random facts:',
          ),
          Text(
            _getFact(),
            style: Theme.of(context).textTheme.display1,
          ),
          FlatButton(
            onPressed: client.openLink,
            child: Text('Open site'),
            color: Colors.red,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
