import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditiation/models/item.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  final List<Item> items= [
    Item(name: "forest", audioPath: "lib/audios/forest.mp3", imagePath: "lib/images/forest.jpeg"),
    Item(name: "night", audioPath: "lib/audios/night.mp3", imagePath: "lib/images/night.jpeg"),
    Item(name: "ocean", audioPath: "lib/audios/ocean.mp3", imagePath: "lib/images/ocean.jpeg"),
    Item(name: "waterfall", audioPath: "lib/audios/waterfall.mp3", imagePath: "lib/images/waterfall.jpeg"),
    Item(name: "wind", audioPath: "lib/audios/wind.mp3", imagePath: "lib/images/wind.jpeg"),
  ];
  final AudioPlayer audioPlayer = AudioPlayer();
  int? playIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
          return Container(
            height: 100,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(
                  items[index].imagePath,
                )
              )
            ),
            child: ListTile(
              title: Text(items[index].name),
              leading: IconButton(
                icon: playIndex==index? FaIcon(FontAwesomeIcons.stop):FaIcon(FontAwesomeIcons.play),
                onPressed: () {
                  if(playIndex==index){
                    setState(() {
                      playIndex==null;
                    });
                    audioPlayer.stop();
                  }
                  else
                  audioPlayer.setAsset(items[index].audioPath);
                  audioPlayer.play();
                  playIndex=index;
                },
              ),
          ),
          );
    }
      ),
      )
    );
  }
}
