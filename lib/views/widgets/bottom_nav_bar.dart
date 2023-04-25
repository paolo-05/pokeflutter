import 'package:flutter/material.dart';
import 'package:pokeflutter/utils/palette.dart';
import '../home_page.dart';
import '../favorite_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final textTheme = Theme.of(context).textTheme;

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows), label: "Compare"),
        BottomNavigationBarItem(icon: Icon(Icons.quiz), label: "Quiz"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border), label: "Favorite"),
      ],
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushNamed(HomePage.route);
            break;
          case 1:
            break;
          case 2:
            break;
          case 3:
            Navigator.of(context)
                .pushNamed(FavoritePage.route, arguments: null);
            break;
          default:
        }
        setState(
          () {
            selectedIndex = index;
          },
        );
      },
      selectedLabelStyle: textTheme.labelMedium,
      unselectedLabelStyle: textTheme.labelMedium?.copyWith(color: gray[300]),
      showUnselectedLabels: true,
    );
  }
}
