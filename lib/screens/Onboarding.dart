import 'package:flutter/material.dart';
import 'package:travel/components/circle.dart';
import 'package:travel/screens/Onboarding2.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Image.asset('images/onboarding1.png')),
            SizedBox(height: 45,),
            
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Make your own private travel plane",
            textAlign: TextAlign.center, 
            style: Theme.of(context).textTheme.titleLarge,)),
            SizedBox(height: media * 0.020,),
             Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Formulate your strategy to receive wonderful gift packs",
            textAlign: TextAlign.center, 
            style: Theme.of(context).textTheme.titleMedium,)
            ),
            
            Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Container(
              padding: EdgeInsets.only(top: media*0.1),
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