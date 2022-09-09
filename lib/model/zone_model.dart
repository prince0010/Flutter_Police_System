import 'dart:convert';

List<Zone> zoneFromJson(String str) =>
    List<Zone>.from(json.decode(str).map((x) => Zone.fromJson(x)));

String zoneToJson(List<Zone> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Zone {
  Zone({
    required this.id,
    required this.first_name,
    required this.middle_name,
    required this.last_name,
    required this.address_id,
  });

  final int id;
  final String first_name;
  final String middle_name;
  final String last_name;
  final int address_id;

  bool selected = false;
  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
      id: json["id"] as int,
      first_name: json["first_name"] as String,
      middle_name: json["middle_name"] as String,
      last_name: json["last_name"] as String,
      address_id: json["address_id"] as int);

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": first_name,
        "middle_name": middle_name,
        "last_name": last_name,
        "address_id": address_id
      };
}
