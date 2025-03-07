import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project_riverpod/user.dart';
import 'package:new_project_riverpod/homeScreen.dart';
import 'package:http/http.dart' as http;


// final nameProvider=Provider<String>((ref)=>'abbas');
// final nameProvider=StateProvider<String?>((ref)=>null);
// final userProvider=StateNotifierProvider<UserNotifier,User>((ref)=>UserNotifier());
//final userChangeNotifierProvider=ChangeNotifierProvider((ref)=>UserChangeNotifier());

final fetchUser = FutureProvider<User>((ref) async {
  const url = 'https://jsonplaceholder.typicode.com/users/1';

   final response = await http.get(Uri.parse(url));

   if (response.statusCode == 200) {
     final data = jsonDecode(response.body) as Map<String, dynamic>;

     return User.fromJson(data);
  } else {
     throw Exception('Failed to load user data');
  }
});

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
