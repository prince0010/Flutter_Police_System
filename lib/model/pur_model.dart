import 'dart:convert';

List<Pur> purFromJson(String str) =>
    List<Pur>.from(json.decode(str).map((x) => Pur.fromJson(x)));

String purToJson(List<Pur> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pur {
  final int id;
  final String name;
  bool selected = false;

  Pur({required this.id, required this.name});

  factory Pur.fromJson(Map<String, dynamic> json) => Pur(
        id: json['id'] as int,
        name: json['name'],
      );
  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
