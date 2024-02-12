import 'package:flutter/material.dart';
import 'package:flutter_app/components/icon_component.dart';
import 'package:flutter_app/components/notes_each_row.dart';
import 'package:flutter_app/components/searchbar_component.dart';
import 'package:flutter_app/config/hive_service.dart';
import 'package:flutter_app/navigation/app_navigation.dart';
import 'package:flutter_app/navigation/navigation_routes.dart';
import 'package:provider/provider.dart';

class ShowNotesScreen extends StatefulWidget {
  const ShowNotesScreen({super.key});

  @override
  State<ShowNotesScreen> createState() => _ShowNotesScreenState();
}

class _ShowNotesScreenState extends State<ShowNotesScreen> {
  final TextEditingController search = TextEditingController();
  var provider;

  @override
  void initState() {
    provider = Provider.of<HiveService>(context, listen: false);
    provider.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SearchBarComponent(value: search),
              Consumer<HiveService>(builder: (context, HiveService, widget) {
                if (HiveService.noteList?.isEmpty == true) {
                  return Center();
                }
                return Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return NoteEachRow(
                              title: HiveService.noteList![index].title,
                              description: HiveService.noteList![index].description);
                        },
                        itemCount: HiveService.noteList?.length ?? 0));
              })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigate(path: NavigationRoutes.addEdit, context: context);
        },
        backgroundColor: Colors.grey,
        child: iconComponent(iconData: Icons.add),
      ),
    );
  }
}
