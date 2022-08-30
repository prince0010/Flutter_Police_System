class UserModel {
  // String? full_name;
  // String? username;
  // String? password;
  // String? address;
  // String? phone_num;

  // userMap() {
  //   var mapping = Map<String, dynamic>();
  //   mapping['full_name'] = full_name!;
  //   mapping['username'] = username!;
  //   mapping['password'] = password!;
  //   mapping['address'] = address!;
  //   mapping['phone_num'] = phone_num!;
  //   return mapping;
  // }
  final String fullName;
  final String username;
  final String password;

  const UserModel(
      {required this.fullName, required this.username, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        fullName: json['fullName'] ?? "",
        username: json['username'] ?? "",
        password: json['password'] ?? "");
  }
}
