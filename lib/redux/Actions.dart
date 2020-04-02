class Actions {
  final String type;
  final dynamic value;

  Actions(this.type, {this.value});
}

class ActionsType {
  static String getTypeFact = "getFact";

  static Actions getFact() => Actions(getTypeFact);
}
