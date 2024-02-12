import 'package:flutter/material.dart';
import 'package:flutter_app/features/ui/screens/add_edit_note_screen.dart';
import 'package:flutter_app/features/ui/screens/show_notes_screen.dart';
import 'package:flutter_app/features/ui/screens/splash_screen.dart';
import 'package:flutter_app/navigation/navigation_routes.dart';

class AppNavigation {
  static Route? onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NavigationRoutes.splash:
        return materialPageRoute(const SplashScreen());
      case NavigationRoutes.addEdit:
        return materialPageRoute(AddEditNotes());
      case NavigationRoutes.note:
        return materialPageRoute(ShowNotesScreen());
    }
    return null;
  }
}

MaterialPageRoute<dynamic> materialPageRoute(Widget widget) =>
    MaterialPageRoute(builder: (context) => widget);

void navigate({required String path, required BuildContext context}) =>
    Navigator.pushNamed(context, path);

void navigateBack(BuildContext context) => Navigator.pop(context);
