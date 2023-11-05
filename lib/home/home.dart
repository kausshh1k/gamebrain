import 'package:flutter/material.dart';
import 'package:gamebrain/login/login.dart';
import 'package:gamebrain/services/auth.dart';
import 'package:gamebrain/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold();
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return const TopicsScreen();
          } else {
            return LoginScreen();
          }
        });
  }
}
