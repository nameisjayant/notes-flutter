import 'package:flutter/material.dart';
import 'package:flutter_app/components/icon_component.dart';

class SearchBarComponent extends StatelessWidget {
  final TextEditingController value;

  const SearchBarComponent({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
        child: TextField(
          controller: value,
          decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
              prefixIcon:
                  iconComponent(iconData: Icons.search, color: Colors.grey),
              suffixIcon: value.text.isEmpty
                  ? null
                  : iconComponent(iconData: Icons.close, color: Colors.grey)),
        ));
  }
}
