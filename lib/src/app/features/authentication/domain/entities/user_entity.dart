class UserEntity {
  final int? id;
  final String username;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final DateTime createdAt;

  const UserEntity({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.createdAt,
  });
}
