import 'package:flutter/material.dart';
import 'package:flutter_app/components/header_component.dart';
import 'package:flutter_app/components/icon_component.dart';
import 'package:flutter_app/components/spacer_component.dart';
import 'package:flutter_app/config/hive_service.dart';
import 'package:flutter_app/data/model/notes.dart';
import 'package:flutter_app/navigation/app_navigation.dart';
import 'package:provider/provider.dart';

class AddEditNotes extends StatelessWidget {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  AddEditNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                HeaderComponent(
                    onClick: () {
                      navigateBack(context);
                    },
                    title: "Add Notes"),
                spacerHeight(),
                TextField(
                  controller: title,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Title",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey)),
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                spacerHeight(),
                TextField(
                  controller: description,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Description",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey)),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var provider = Provider.of<HiveService>(context, listen: false);
          provider.insert(Notes(title.text, description.text));
          provider.getNotes();
          navigateBack(context);
        },
        backgroundColor: Colors.grey,
        child: iconComponent(iconData: Icons.check),
      ),
    );
  }
}
