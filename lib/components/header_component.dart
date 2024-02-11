import 'package:flutter/material.dart';
import 'package:flutter_app/components/icon_component.dart';

class HeaderComponent extends StatelessWidget {
  final Function() onClick;
  final String title;

  const HeaderComponent(
      {super.key, required this.onClick, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onClick, icon: iconComponent(iconData: Icons.arrow_back)),
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
