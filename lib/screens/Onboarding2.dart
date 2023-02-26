import 'package:flutter/material.dart';
import 'package:travel/components/circle.dart';
import 'package:travel/screens/Onbarding3.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: media*0.5,
            
            child: Image.asset('images/onboarding2.png')),
           
            
          Container(
            height: media*0.15,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(" Customize your - High end travel",
            textAlign: TextAlign.center, 
            style: Theme.of(context).textTheme.titleLarge,)),
             Container(
              height: media * 0.15,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Countless high-end entertainment facilities",
            textAlign: TextAlign.center, 
            style: Theme.of(context).textTheme.titleMedium,)
            ),
         Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Container(
              
              child: GestureDetector( onTap: () =>Navigator.push(context, MaterialPageRoute(
                builder: (context) => Onboarding3())),
                child: Circle()),
            ),
          ],
         )
            
        ],
      ),
    );
  }
}