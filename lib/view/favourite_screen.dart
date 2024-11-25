import 'package:flutter/material.dart';
import 'package:music_player_app/view/music_screen.dart';
import 'package:provider/provider.dart';

import '../provider/music_provider.dart';
import '../utils/colors.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // instance of the provider
    final providerTrue = Provider.of<MusicProvider>(context);
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blueGrey, green],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  'My Music',
                  style: TextStyle(
                    fontSize: 20,
                    color: green,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: providerTrue.favouriteList.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            MusicScreen(result: providerTrue.favouriteList),
                      ),
                    );
                  },
                  leading: Image.network(
                      providerTrue.favouriteList[index].image[2].url),
                  title: Text(providerTrue.favouriteList[index].name),
                  subtitle: Text(providerTrue.favouriteList[index].album.name),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
