class Cliente {
  final int? id;
  final String dni;
  final String name;
  final String email;
  final String phone;

  Cliente({
    required this.id,
    required this.dni,
    required this.name,
    required this.email,
    required this.phone,
  });

  Cliente copyWith({
    int? id,
    String? dni,
    String? name,
    String? email,
    String? phone,
  }) {
    return Cliente(
      id: id ?? this.id,
      dni: dni ?? this.dni,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "dni": dni,
    "name": name,
    "email": email,
    "phone": phone,
  };

  factory Cliente.fromMap(Map<String, dynamic> map) => Cliente(
    id: map["id"],
    dni: map["dni"],
    name: map["name"],
    email: map["email"],
    phone: map["phone"],
  );
}
