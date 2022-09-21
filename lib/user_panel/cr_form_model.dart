class CR {
  final String firstname;
  final String middlename;
  final String lastname;
  final String dateofbirth;
  const CR(
      {required this.firstname,
      required this.middlename,
      required this.lastname,
      required this.dateofbirth});

  factory CR.fromJson(Map<String, dynamic> json) {
    return CR(
      firstname: json['first_name'] as String,
      middlename: json['middle_name'] as String,
      lastname: json['last_name'] as String,
      dateofbirth: json['date_of_birth'] as String,
    );
  }
}
