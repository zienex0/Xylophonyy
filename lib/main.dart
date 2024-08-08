import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text(
            'Xylophony',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
        ),
        body: const Column(
          children: [
            BuildKeyHelper(keyColor: Colors.red, noteIndex: 1),
            BuildKeyHelper(keyColor: Colors.orange, noteIndex: 2),
            BuildKeyHelper(keyColor: Colors.yellow, noteIndex: 3),
            BuildKeyHelper(keyColor: Colors.green, noteIndex: 4),
            BuildKeyHelper(keyColor: Colors.blue, noteIndex: 5),
            BuildKeyHelper(keyColor: Colors.purple, noteIndex: 6),
            BuildKeyHelper(keyColor: Colors.pink, noteIndex: 7),
          ],
        ),
      ),
    );
  }
}

class BuildKeyHelper extends StatelessWidget {
  final Color keyColor;
  final int noteIndex;
  const BuildKeyHelper(
      {super.key, required this.keyColor, required this.noteIndex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: XylophoneKey(keyColor: keyColor, noteIndex: noteIndex));
  }
}

class XylophoneKey extends StatelessWidget {
  final Color keyColor;
  final int noteIndex;

  const XylophoneKey(
      {super.key, required this.keyColor, required this.noteIndex});

  void playSound() async {
    final player = AudioPlayer();
    await player.play(AssetSource('/assets_note$noteIndex.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: playSound,
            child: Container(
              color: keyColor,
            ),
          ),
        )
      ],
    );
  }
}
