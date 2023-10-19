// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class City {
  final int id;
  final String name;

  City(this.id, this.name);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      map['id'] as int,
      map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) =>
      City.fromMap(json.decode(source) as Map<String, dynamic>);
}
