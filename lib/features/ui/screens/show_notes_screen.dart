import 'package:flutter/material.dart';
import 'package:flutter_app/components/icon_component.dart';
import 'package:flutter_app/components/notes_each_row.dart';
import 'package:flutter_app/components/searchbar_component.dart';
import 'package:flutter_app/navigation/navigation_routes.dart';

class ShowNotesScreen extends StatelessWidget {
  final TextEditingController search = TextEditingController();

  ShowNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SearchBarComponent(value: search),
              Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return const NoteEachRow(
                            title: "Title ", description: "Hell How are you");
                      },
                      itemCount: 50))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NavigationRoutes.addEdit);
        },
        backgroundColor: Colors.grey,
        child: iconComponent(iconData: Icons.add),
      ),
    );
  }
}
