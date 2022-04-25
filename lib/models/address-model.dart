class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  static Address fromJson(Map map) {
    return Address(
      street: map["street"],
      suite: map["suite"],
      city: map["city"],
      zipcode: map["zipcode"],
      geo: Geo.fromJson(
        map["geo"],
      ),
    );
  }
}

class Geo {
  final String lat;
  final String lng;

  const Geo({
    required this.lat,
    required this.lng,
  });

  static Geo fromJson(Map map) {
    return Geo(
      lat: map["lat"],
      lng: map["lng"],
    );
  }
}
