import 'package:gamebrain/about/about.dart';
import 'package:gamebrain/home/home.dart';
import 'package:gamebrain/login/login.dart';
import 'package:gamebrain/profile/profile.dart';
import 'package:gamebrain/topics/topics.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/about': (context) => const AboutScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/topics': (context) => const TopicsScreen()
};
