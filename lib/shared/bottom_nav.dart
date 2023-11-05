import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: HeroIcon(
              HeroIcons.puzzlePiece,
              size: 20,
            ),
            label: 'Games'),
        // BottomNavigationBarItem(
        //     icon: HeroIcon(
        //       HeroIcons.bolt,
        //       size: 20,
        //     ),
        //     label: 'About'),
        BottomNavigationBarItem(
            icon: HeroIcon(
              HeroIcons.userCircle,
              size: 20,
            ),
            label: 'Profile')
      ],
      fixedColor: Colors.deepOrange[200],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            break;
          // case 1:
          //   Navigator.pushNamed(context, '/about');
          //   break;
          case 1:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
