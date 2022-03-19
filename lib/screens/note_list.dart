import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Float button clicked');
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text('Cook beans', style: textStyle),
            subtitle: const Text('Do this at night'),
            trailing: const Icon(Icons.delete, color: Colors.grey),
            onTap: () {
              debugPrint('List Print');
            },
          ),
        );
      },
    );
  }
}
