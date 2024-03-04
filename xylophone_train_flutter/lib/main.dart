import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playSound(int noteNumber) {
    final player = AudioPlayer();
    player.play(
      AssetSource('note$noteNumber.wav'),
    );
  }

  Expanded buildKey(
      {required MaterialColor noteColor,
      required int noteNumber,
      required String note}) {
    return Expanded(
      child: Container(
        color: noteColor,
        child: TextButton(
          onPressed: () {
            playSound(noteNumber);
          },
          child: Text(
            note,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(note: 'Do', noteColor: Colors.red, noteNumber: 1),
              buildKey(note: 'Ré', noteColor: Colors.orange, noteNumber: 2),
              buildKey(note: 'Mi', noteColor: Colors.yellow, noteNumber: 3),
              buildKey(note: 'Fa', noteColor: Colors.green, noteNumber: 4),
              buildKey(note: 'Sol', noteColor: Colors.teal, noteNumber: 5),
              buildKey(note: 'La', noteColor: Colors.blue, noteNumber: 6),
              buildKey(note: 'Si', noteColor: Colors.purple, noteNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
