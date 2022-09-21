class Position {
  final String name;

  const Position({required this.name});

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      name: json['name'],
    );
  }
}
