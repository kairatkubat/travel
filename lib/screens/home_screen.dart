import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            SizedBox(height: media *0.08,),
            Container(child: Text("Find your next trip")),
            Container(
              child: Text("Nordic scenery" , style:  Theme.of(context).textTheme.titleLarge,)),
              Row(
                children: [
              
                  
                ],
              )

          ],

        ),
      ),
    );
  }
}