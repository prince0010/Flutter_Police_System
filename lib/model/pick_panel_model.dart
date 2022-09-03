class User {
  const User({
    required this.firstname,
    required this.middlename,
    required this.lastname,
    required this.contact_no,
    required this.date_of_birth,
    required this.place_of_birth,
    required this.civil_status,
    required this.height,
    required this.sex,
    required this.nationality,
    required this.address,
  });

  final String firstname;
  final String middlename;
  final String lastname;
  final String contact_no;
  final String date_of_birth;
  final String place_of_birth;
  final String civil_status;
  final String height;
  final String sex;
  final String nationality;
  final String address;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json['first_name'],
        middlename: json['middle_name'],
        lastname: json['last_name'],
        contact_no: json['contact_no'],
        date_of_birth: json['date_of_birth'],
        place_of_birth: json['place_of_birth'],
        civil_status: json['civil_status'],
        height: json['height'],
        sex: json['sex'],
        nationality: json['nationality'],
        address: json['address_id'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstname,
        'middle_name': middlename,
        'last_name': lastname,
        'contact_no': contact_no,
        'date_of_birth': date_of_birth,
        'place_of_birth': place_of_birth,
        'civil_status': civil_status,
        'height': height,
        'sex': sex,
        'nationality': nationality,
        'address_id': address,
      };

 
}
