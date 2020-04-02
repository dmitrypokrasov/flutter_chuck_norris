import 'package:flutter/material.dart';
import 'package:flutterapp/api/ChuckFact.dart';

class FactList extends StatelessWidget {
  final List<ChuckFact> _facts;

  FactList(this._facts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _facts.length,
        itemBuilder: (context, index) {
          return _FactBox(
              _facts[index].id, _facts[index].fact, _facts[index].category);
        });
  }
}

class _FactBox extends StatelessWidget {
  final String _id;
  final String _fact;
  final List _category;

  _FactBox(this._id, this._fact, this._category);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.grey,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              _fact,
              style: TextStyle(fontSize: 20.0),
              softWrap: true,
            ),
          ))
        ],
      ),
    );
  }
}
