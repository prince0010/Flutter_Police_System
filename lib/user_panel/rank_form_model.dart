class Albums {
  final String name;

  const Albums({required this.name});

  factory Albums.fromJson(Map<String, dynamic> json) {
    return Albums(
      name: json['name'],
    );
  }
}
