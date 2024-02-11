import 'package:flutter/material.dart';
import 'package:flutter_app/components/header_component.dart';
import 'package:flutter_app/navigation/app_navigation.dart';

class AddEditNotes extends StatelessWidget {
  const AddEditNotes({super.key});

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
                title: "Add Notes")
          ],
        ),
      )),
    );
  }
}
