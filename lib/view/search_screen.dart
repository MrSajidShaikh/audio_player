import 'package:flutter/material.dart';
import 'package:music_player_app/modal/music_modal.dart';
import 'package:music_player_app/view/component/my_text_field.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../provider/music_provider.dart';
import '../utils/colors.dart';
import 'music_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getObject();
  }

  @override
  Widget build(BuildContext context) {
    // instance of the provider
    final providerTrue = Provider.of<MusicProvider>(context);
    final providerFalse = Provider.of<MusicProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blueGrey, green],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                SizedBox(
                  width: height * 0.01,
                ),
                Expanded(
                  child: MyTextField(
                    onChanged: (value) {
                      providerFalse.searchData(value);
                    },
                    prefixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.search,
                        color: green,
                      ),
                      color: green,
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: providerTrue.fetchSearchApiData(providerTrue.search),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Result> result = providerTrue.searchList!.data.result;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () async {
                          // passing current index to selectedIndex
                          providerTrue.selectedIndex = index;

                          // setting the path of the music to the audioPlayer which user selected
                          providerTrue.audioPlayer
                              .setUrl(result[index].downloadUrl[3].url);
                          providerFalse.togglePlay();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MusicScreen(
                                result: result,
                              ),
                            ),
                          );
                        },
                        leading: Image.network(result[index].image[2].url),
                        title: Text(result[index].name),
                        subtitle: Text(result[index].album.name),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.white.withOpacity(0.2),
                      highlightColor: Colors.white.withOpacity(0.3),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => ListTile(
                          leading: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: height * 0.1,
                            width: width * 0.15,
                            color: Colors.white.withOpacity(0.3),
                          ),
                          title: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: height * 0.02,
                            width: width * 0.6,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          subtitle: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: height * 0.02,
                            width: width * 0.6,
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getObject() async {
    var provider = Provider.of<MusicProvider>(context, listen: false);
    provider.searchList = await provider.fetchSearchApiData("Jass");
  }
}
