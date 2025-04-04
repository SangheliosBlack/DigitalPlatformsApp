class UserDTO {

  final String id;
  final String email;
  final String name;
  final String role;
  final String roleName;
  final DateTime lastUpdate;

  UserDTO({
    required this.id,
    required this.email, 
    required this.name, 
    required this.role, 
    required this.lastUpdate,
    required this.roleName
  });

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      id: map['id'],
      email: map['email'],
      name: map['full_name'],
      role: map['role'],
      roleName: map['role_name'],
      lastUpdate: DateTime.parse(map['last_login_date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'role': role,
      'lastUpdate': lastUpdate.toIso8601String(),
    };
  }

}