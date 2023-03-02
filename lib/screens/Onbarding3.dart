import 'package:flutter/material.dart';
import 'package:travel/components/circle.dart';
import 'package:travel/screens/Onboarding.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: media * 0.5,
            child: Image.asset('images/onboarding3.png'),
          ),
          Container(
            height: media * 0.15,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'High-end leisure projects to choose from',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            height: media * 0.15,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "The world's first-class modern leisure and entertainment method",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onboarding()),
                ),
                child: const Circle(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
