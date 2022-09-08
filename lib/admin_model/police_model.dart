import 'dart:convert';

List<Police> employeesFromJson(String str) =>
    List<Police>.from(json.decode(str).map((x) => Police.fromJson(x)));

String employeesToJson(List<Police> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Police {
  Police({
    required this.id,
    required this.first_name,
    required this.middle_name,
    required this.last_name,
    required this.contact_no,
  });

  final int id;
  final String first_name;
  final String middle_name;
  final String last_name;
  final String contact_no;
  bool selected = false;
  factory Police.fromJson(Map<String, dynamic> json) => Police(
      id: json["id"] as int,
      first_name: json["first_name"] as String,
      middle_name: json["middle_name"] as String,
      last_name: json["last_name"] as String,
      contact_no: json["contact_no"] as String);

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": first_name,
        "middle_name": middle_name,
        "last_name": last_name,
        "contact_no": contact_no
      };
}
