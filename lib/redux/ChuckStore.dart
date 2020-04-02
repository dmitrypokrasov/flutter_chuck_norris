import 'package:flutterapp/api/ChuckFact.dart';

class ChuckStore {
  ChuckFact fact;
  List<ChuckFact> facts;

  ChuckStore(this.fact, this.facts);

  ChuckStore clone() {
    return ChuckStore(null, null)
      ..fact = fact
      ..facts = facts;
  }
}
