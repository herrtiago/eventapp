class Usuario {
  final int id;
  final String username;
  final String email;
  final DateTime createdAt;

  Usuario({
    required this.id,
    required this.username,
    required this.email,
    required this.createdAt,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
