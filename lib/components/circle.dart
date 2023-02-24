import 'package:flutter/material.dart';

class Circle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/arrow.png'),
      height: 76,
      width: 76,
      
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50)),
      
    );
  }
}