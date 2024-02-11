import 'package:flutter/material.dart';
import 'package:flutter_app/features/ui/screens/show_notes_screen.dart';
import 'package:flutter_app/navigation/app_navigation.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowNotesScreen(),
      onGenerateRoute: AppNavigation.onGenerateRoutes,
    );
  }
}
