import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }
}


// class UserNotifier extends StateNotifier<User> {
//   UserNotifier():super(User(name: '', age: 0));
//
//   void updateName(String n) {
//     state = state.copyWith(name: n);
//   }  void updateAge(int age) {
//     state = state.copyWith(age: age);
//   }
// }


// class UserChangeNotifier extends ChangeNotifier{
//   User user=User(name: '', age: 0);
//
//   void updateName(String n) {
//     user = user.copyWith(name: n);
//     notifyListeners();
//   }
//
//   void updateAge(int age) {
//     user = user.copyWith(age: age);
//     notifyListeners();
//
//   }
