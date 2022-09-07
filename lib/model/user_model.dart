class User {
  final int id;
  final String first_name;
  final String middle_name;
  final String last_name;
  final String contact_no;
  final String username;

  User(
      {required this.id,
      required this.first_name,
      required this.middle_name,
      required this.last_name,
      required this.contact_no,
      required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      first_name: json['first_name'] as String,
      middle_name: json['middle_name'] as String,
      last_name: json['last_name'] as String,
      contact_no: json['contact_no'] as String,
      username: json['username'] as String,
    );
  }
}
