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
          return ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.red, child: Text(_facts[index].id)),
            title: Text("Random fact:"),
            subtitle: Text(_facts[index].fact),
          );
        });
  }
}
