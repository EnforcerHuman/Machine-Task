import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_listing/features/auth/domain/entities/user.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends User {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String phoneNumber;

  @HiveField(3)
  final String profession;

  @HiveField(4)
  final String password;

  UserModel({
    required this.password,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profession,
  }) : super(
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            profession: profession,
            password: password);

  // Factory method to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      password: json['password'] as String, // Include password in fromJson
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profession: json['profession'] as String,
    );
  }

  // Method to convert a UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profession': profession,
      'password': password, // Include password in toJson
    };
  }
}
