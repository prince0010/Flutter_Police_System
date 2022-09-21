class CO {
  final String name;

  const CO({required this.name});

  factory CO.fromJson(Map<String, dynamic> json) {
    return CO(
      name: json['name'],
    );
  }
}
