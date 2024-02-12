import 'package:flutter/material.dart';
import 'package:flutter_app/config/hive_service.dart';
import 'package:flutter_app/features/ui/screens/show_notes_screen.dart';
import 'package:flutter_app/navigation/app_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  HiveService.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HiveService>(
      create: (context) => HiveService(),
      child: const MaterialApp(
        home: ShowNotesScreen(),
        onGenerateRoute: AppNavigation.onGenerateRoutes,
      ),
    );
  }
}
