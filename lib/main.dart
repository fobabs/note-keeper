import 'package:flutter/material.dart';
import 'package:note_keeper/screens/note_detail.dart';
// import 'package:note_keeper/screens/note_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Keeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const NoteDetail(),
    );
  }
}
