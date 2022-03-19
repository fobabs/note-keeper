class Note {
  late final int _id;
  late final String _title;
  late final String? _description;
  late final String date;
  late final int _priority;

  Note(this._title, this.date, this._priority, [this._description]);

  Note.withId(this._id, this._title, this.date, this._priority,
      [this._description]);

  int get id => _id;
  String get title => _title;
  String get description => _description!;
  int get priority => _priority;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set descrition(String newDescription) {
    if (newDescription.length <= 255) {
      _title = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      _priority = newPriority;
    }
  }

  // Convert Note to a Map object
  Map toMap() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['date'] = date;
    map['priority'] = priority;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _description = map['description'];
    date = map['date'];
    _priority = map['priority'];
  }
}
