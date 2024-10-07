import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_listing/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser(String email, String password);
  Future<bool> isUserExists(String email, String password);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final String _boxName = 'userBox';

  @override
  Future<void> saveUser(UserModel user) async {
    var box = await Hive.openBox<UserModel>(_boxName);
    bool test = await isUserExists(user.email, user.password);
    try {
      if (!test) {
        await box.put(user.email, user); // Save user with email as key
      } else {
        throw Exception('User Already Exists');
      }
    } catch (e) {
      throw Exception('Failed to save user');
    }
  }

  @override
  Future<UserModel?> getUser(String email, String password) async {
    var box = await Hive.openBox<UserModel>(_boxName);
    if (box.isEmpty) {
      return null;
    } else {
      for (var user in box.values) {
        if (user.email == email && user.password == password) {
          return user;
        }
      }
    }
  }

  @override
  Future<bool> isUserExists(String email, String password) async {
    var box = await Hive.openBox<UserModel>(_boxName);
    final existingUser = box.get(email); // Get user by email
    print(existingUser);
    return existingUser != null; // Return true if user exists
  }
}
