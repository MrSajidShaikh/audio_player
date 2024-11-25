import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:music_player_app/utils/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomBar(backgroundColor: Colors.teal,
      selectedIndex: 0,
      items: [
        BottomBarItem(
          icon: const Icon(Icons.home_outlined),
          activeColor: green,
          title: const Text("Home"),
        ),
        BottomBarItem(
          icon: const Icon(Icons.trending_up),
          activeColor: green,
          title: const Text("Top Charts"),
        ),
        BottomBarItem(
          icon: const Icon(Icons.play_arrow),
          activeColor: green,
          title: const Text("YouTube"),
        ),
        BottomBarItem(
          icon: const Icon(Icons.library_add_check_rounded),
          activeColor: green,
          title: const Text("Library"),
        ),
      ],
      onTap: (value) {},
    );
  }
}
