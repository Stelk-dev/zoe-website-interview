import 'package:zoe/models/address-model.dart';
import 'package:zoe/models/company-model.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address? address;
  final String phone;
  final String website;
  final Company? company;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  static User fromJson(Map map) {
    return User(
      id: map["id"],
      name: map["name"],
      username: map["username"],
      email: map["email"],
      address: Address.fromJson(map["address"]),
      phone: map["phone"],
      website: map["website"],
      company: Company.fromJson(map["company"]),
    );
  }

  static User anonymous() {
    return User(
      id: 0,
      name: "Anonymous",
      username: "Anonymous",
      email: "",
      address: null,
      phone: "",
      website: "",
      company: null,
    );
  }
}
