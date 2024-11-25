import 'package:flutter/material.dart';
import 'package:music_player_app/view/about_screen.dart';
import 'package:music_player_app/view/favourite_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          children: [
            const SizedBox(height: 70,),
            const Icon(
              size: 90,
              Icons.music_video_sharp,
            ),
            const SizedBox(
              height: 50,
              width: double.infinity,
            ),
            _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _createDrawerItem(
              icon: Icons.music_note,
              text: 'My Music',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FavouriteScreen(),
                  ),
                );
              },
            ),
            _createDrawerItem(
              icon: Icons.download,
              text: 'Downloads',
              onTap: () {},
            ),
            _createDrawerItem(
              icon: Icons.playlist_play,
              text: 'Playlists',
              onTap: () {},
            ),
            _createDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {},
            ),
            _createDrawerItem(
              icon: Icons.info_outline,
              text: 'About',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile _createDrawerItem({
    required IconData icon,
    required String text,
    void Function()? onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}
