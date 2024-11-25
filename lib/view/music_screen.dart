import 'package:flutter/material.dart';
import 'package:music_player_app/modal/music_modal.dart';
import 'package:provider/provider.dart';
import '../provider/music_provider.dart';
import '../utils/colors.dart';

class MusicScreen extends StatelessWidget {
  final List<Result> result;

  const MusicScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<MusicProvider>(context);
    final providerFalse = Provider.of<MusicProvider>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.queue_music),
                  ),
                  PopupMenuButton(
                    color: black1,
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) {
                      return [
                        buildPopupMenuItem(Icons.album, 'View Album'),
                        buildPopupMenuItem(
                            Icons.playlist_add, 'Add to Playlist'),
                        buildPopupMenuItem(Icons.av_timer, 'View Album'),
                        buildPopupMenuItem(Icons.play_circle, 'Search Video'),
                        buildPopupMenuItem(Icons.info, 'Song Info'),
                      ];
                    },
                  ),
                ],
              ),
              Container(
                height: height * 0.37,
                width: width,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: black1,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        result[providerTrue.selectedIndex].image[2].url),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Text(
                result[providerTrue.selectedIndex].name,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                result[providerTrue.selectedIndex].album.name,
                style: const TextStyle(
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Speed'),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (providerTrue.speed > 0.5) {
                                      providerFalse.toggleSpeed(
                                          providerTrue.speed - 0.25);
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Consumer<MusicProvider>(
                                    builder: (context, value, child) {
                                  return Text('${value.speed}x');
                                }),
                                IconButton(
                                  onPressed: () {
                                    if (providerTrue.speed < 2.0) {
                                      providerFalse.toggleSpeed(
                                          providerTrue.speed + 0.25);
                                    }
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      '${providerTrue.speed}x',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.06,
                  ),
                ],
              ),
              Consumer<MusicProvider>(builder: (context, value, child) {
                return Slider(
                  value: value.positionOfTheSlider()!.inSeconds.toDouble(),
                  max: value.durationOfTheTimer()!.inSeconds.toDouble(),
                  activeColor: Colors.white,
                  inactiveColor: Colors.white.withOpacity(0.2),
                  onChanged: (value) {
                    value = value;
                    providerFalse.changeToSeconds(value.toInt());
                  },
                );
              }),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<MusicProvider>(builder: (context, value, child) {
                      return Text(
                          value.positionOfTheSlider().toString().split(".")[0]);
                    }),
                    Consumer<MusicProvider>(builder: (context, value, child) {
                      return Text(
                          value.durationOfTheTimer().toString().split(".")[0]);
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.shuffle),
                  ),
                  SizedBox(
                    width: width * 0.1,
                  ),
                  IconButton(
                    onPressed: () {
                      if (providerTrue.selectedIndex > 0) {
                        providerFalse.backSong(result);
                      }
                    },
                    icon: const Icon(
                      Icons.skip_previous,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      providerFalse.togglePlay();
                    },
                    icon: Consumer<MusicProvider>(
                        builder: (context, value, child) {
                      return Icon(
                        (!value.isPlay)
                            ? Icons.play_circle
                            : Icons.pause_circle,
                        size: 70,
                      );
                    }),
                  ),
                  IconButton(
                    onPressed: () {
                      if (providerTrue.selectedIndex < 10) {
                        providerFalse.forwardSong(result);
                      }
                    },
                    icon: const Icon(
                      Icons.skip_next,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.1,
                  ),
                  const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.swap_calls),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      providerFalse.addingFavouriteSongs(result, context);
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.black.withOpacity(0.4),
                    context: context,
                    builder: (context) => SizedBox(
                      height: height * 0.3,
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.007,
                            width: width * 0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const Text(
                            'Up Next',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          ListTile(
                            leading: Container(
                              height: height * 0.06,
                              width: width * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      result[providerTrue.selectedIndex]
                                          .image[2]
                                          .url),
                                ),
                              ),
                            ),
                            title:
                                Text(result[providerTrue.selectedIndex].name),
                            subtitle: const Text('Playing'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      height: height * 0.007,
                      width: width * 0.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Text(
                      'Up Next',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuItem<dynamic> buildPopupMenuItem(IconData icon, String text) {
    return PopupMenuItem(
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(text),
        ],
      ),
    );
  }
}
