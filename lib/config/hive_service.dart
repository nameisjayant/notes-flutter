import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data/model/notes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService extends ChangeNotifier {
  static Box<Notes>? noteBox;
  static String boxName = "note";
  List<Notes>? noteList = [];

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NotesAdapter());
    try {
      noteBox = await Hive.openBox<Notes>(boxName);
    } catch (e, s) {
      await Hive.deleteBoxFromDisk(boxName).onError(
        (error, stackTrace) {
          log("DELETE_BOX_FROM_DISK ERROR :: $e");
          log("delete-box-from-disk ERROR S :: $s");
        },
      );
      log("ERROR :: $e");
      log("ERROR S :: $s");
    }
  }

  void insert(Notes note)  {
     noteBox?.add(note);
    notifyListeners();
  }

  void getNotes() {
    noteList = noteBox?.values.toList();
    notifyListeners();
  }

  void update(int index, Notes note) {
    noteBox?.put(index, note);
    notifyListeners();
  }

  void delete(int index) {
    noteBox?.deleteAt(index);
    notifyListeners();
  }
}
