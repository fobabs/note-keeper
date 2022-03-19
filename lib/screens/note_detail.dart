import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({Key? key}) : super(key: key);

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  static final List<String> _priorities = ['High', 'Low'];
  String _selectedPriorities = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedPriorities = _priorities[1];
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem) {
                  return DropdownMenuItem(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String? valueSelectedByUser) {
                  setState(() {
                    _selectedPriorities = valueSelectedByUser!;
                  });
                },
                value: _selectedPriorities,
                style: textStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                onChanged: (value) {
                  debugPrint('');
                },
                style: textStyle,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                onChanged: (value) {
                  debugPrint('');
                },
                style: textStyle,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorDark,
                        onPrimary: Theme.of(context).primaryColorLight,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorDark,
                        onPrimary: Theme.of(context).primaryColorLight,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Delete',
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
