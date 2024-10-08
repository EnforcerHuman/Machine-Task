import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_listing/features/auth/data/models/user_model.dart';

/// Abstract class defining the local data source for authentication.
abstract class AuthLocalDataSource {
  /// Saves a user to the local storage.
  Future<void> saveUser(UserModel user);

  /// Retrieves a user from local storage based on the provided email and password.
  Future<UserModel?> getUser(String email, String password);

  /// Checks if a user exists in local storage based on the provided email and password.
  Future<bool> isUserExists(String email, String password);
}

/// Implementation of the AuthLocalDataSource using Hive for local storage.
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  /// The name of the Hive box where user data will be stored.
  final String _boxName = 'userBox';

  /// Saves a user to the local Hive database.
  /// Throws an exception if the user already exists.
  @override
  Future<void> saveUser(UserModel user) async {
    var box = await Hive.openBox<UserModel>(_boxName); // Open the Hive box

    // Check if the user already exists to prevent duplication
    bool userExists = await isUserExists(user.email, user.password);

    try {
      if (!userExists) {
        // Save the user with their email as the key
        await box.put(user.email, user);
      } else {
        throw Exception('User Already Exists'); // User already exists
      }
    } catch (e) {
      throw Exception(
          'Failed to save user'); // Catch any exceptions during save
    }
  }

  /// Retrieves a user from local storage using email and password.
  /// Returns null if no matching user is found.
  @override
  Future<UserModel?> getUser(String email, String password) async {
    var box = await Hive.openBox<UserModel>(_boxName); // Open the Hive box

    // Return null if the box is empty
    if (box.isEmpty) {
      return null;
    } else {
      // Iterate through all users in the box to find a match
      for (var user in box.values) {
        if (user.email == email && user.password == password) {
          return user; // Return the matched user
        }
      }
    }
    return null; // Return null if no match found
  }

  /// Checks if a user exists in the local storage using their email and password.
  /// Returns true if the user exists, false otherwise.
  @override
  Future<bool> isUserExists(String email, String password) async {
    var box = await Hive.openBox<UserModel>(_boxName); // Open the Hive box

    // Retrieve the user by their email
    final existingUser = box.get(email);
    print(existingUser); // Debugging: print existing user for verification

    return existingUser != null; // Return true if user exists, otherwise false
  }
}
