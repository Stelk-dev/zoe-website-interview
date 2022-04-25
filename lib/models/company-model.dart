class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  static Company fromJson(Map map) {
    return Company(
      name: map["name"],
      catchPhrase: map["catchPhrase"],
      bs: map["catchPhrase"],
    );
  }
}
