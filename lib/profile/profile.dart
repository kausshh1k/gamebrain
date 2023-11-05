import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gamebrain/services/auth.dart';
import 'package:gamebrain/shared/loading.dart';

import '../services/models.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('Profile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.photoURL ??
                        'https://www.gravatar.com/avatar/placeholder'),
                  ),
                ),
              ),
              Text(user.displayName ?? 'Guest',
                  style: Theme.of(context).textTheme.headline6),
              const Spacer(),
              Text('${report.total}',
                  style: Theme.of(context).textTheme.headline2),
              report.total > 1
                  ? Text('Quizzes completed',
                      style: Theme.of(context).textTheme.subtitle2)
                  : Text('Quiz completed',
                      style: Theme.of(context).textTheme.subtitle2),
              const Spacer(),
              ElevatedButton(
                child: const Text('log out'),
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    } else {
      return Loader();
    }
  }
}
