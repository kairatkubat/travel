import 'package:flutter/material.dart';

class TextInputSearch extends StatelessWidget {
  const TextInputSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(border: OutlineInputBorder(),
        hintText: 'search'
        ),
      ),
    );
  }
}