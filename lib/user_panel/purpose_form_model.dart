class Purpose {
  final String name;

  const Purpose({required this.name});

  factory Purpose.fromJson(Map<String, dynamic> json) {
    return Purpose(
      name: json['name'],
    );
  }
}
