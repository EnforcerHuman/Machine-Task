class User {
  final String name;
  final String email;
  final String phoneNumber;
  final String profession;
  final String password;

  // Remove `const` if you need to create instances that are not compile-time constants.
  const User({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profession,
    required this.password,
  });
}
