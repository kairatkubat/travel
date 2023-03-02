import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel/components/circle.dart';
import 'package:travel/screens/Onboarding2.dart';


class Onboarding extends StatelessWidget {
  bool land = false;


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.height;
    return   Scaffold(
      body: Column(
        children: [
          
            // padding: EdgeInsets.only(top: 100),
             Image.asset('images/onboarding1.png'),
            
           
          Container(
            height: media * 0.15,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Make your own private travel plane",
            textAlign: TextAlign.center, 
            style: Theme.of(context).textTheme.titleLarge,)),
            
             Container(
               height: media * 0.15,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Formulate your strategy to receive wonderful gift packs",
            textAlign: TextAlign.center, 
            style: Theme.of(context).textTheme.titleMedium,)
            
            ),
            
            Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Container(
             
              child: GestureDetector( onTap: () =>Navigator.push(context, MaterialPageRoute(
                builder: (context) => Onboarding2())),
                child: Circle()),
            ),
          ],
         )
            
        ],
      ),
    );
  }
}