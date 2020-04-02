class ChuckFact {
  final String _id;
  final String _fact;
  final List _category;

  ChuckFact(this._id, this._fact, this._category);

  List get category => _category;

  String get fact => _fact;

  String get id => _id;
}
