import 'package:flutterapp/api/ChuckFact.dart';
import 'package:flutterapp/redux/Actions.dart';
import 'package:flutterapp/redux/ChuckStore.dart';
import 'package:flutterapp/api/Client.dart' as client;

ChuckStore getFactReducer(ChuckStore state, dynamic action) {
  if (action.type == ActionsType.getTypeFact) {
    client.getFact().then((newFact) {
      ChuckStore newState = state.clone();

      if (newFact != null) {
        List<ChuckFact> newFacts = List.from(state.facts)..add(newFact);
        return newState
          ..fact = newFact
          ..facts = newFacts;
      }

      return newState;
    });
  }

  return state;
}
