import 'dart:convert';

List<DataPolice> policeModelFromJson(String str) =>
    List<DataPolice>.from(json.decode(str).map((x) => DataPolice.fromJson(x)));

String policeModelToJson(List<DataPolice> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//calling the API Objects to this model

class DataPolice {
  int id;
  String first_name;
  String middle_name;
  String last_name;
  String contact_no;

  DataPolice(
      {required this.id,
      required this.first_name,
      required this.last_name,
      required this.middle_name,
      required this.contact_no});

  factory DataPolice.fromJson(Map<String, dynamic> json) {
    return DataPolice(
      id: json['id'] as int,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      middle_name: json['middle_name'] as String,
      contact_no: json['contact_no'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': first_name,
        'middle_name': middle_name,
        'last_name': last_name,
        'contact_no': contact_no
      };
}
