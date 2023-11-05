import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:gamebrain/services/auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/loginLogo.png'),
                Flexible(
                  child: LoginButton(
                    icon: HeroIcon(HeroIcons.userCircle),
                    color: Colors.grey[900],
                    text: 'Continue as guest',
                    loginMethod: AuthService().anonLogin,
                  ),
                ),
                Flexible(
                  child: LoginButton(
                    icon: Icon(FontAwesomeIcons.google),
                    color: Colors.blue,
                    text: 'Continue with Google',
                    loginMethod: AuthService().googleLogin,
                  ),
                ),
                FutureBuilder<Object>(
                  future: SignInWithApple.isAvailable(),
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return SignInWithAppleButton(
                        onPressed: () {
                          AuthService().signInWithApple();
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            )));
  }
}

class LoginButton extends StatelessWidget {
  final Color? color;
  final icon;
  final String text;
  final Function loginMethod;
  const LoginButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.color,
      required this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
          icon: icon,
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20), backgroundColor: color),
          onPressed: () => loginMethod(),
          label: Text(
            text,
            textAlign: TextAlign.center,
          )),
    );
  }
}
