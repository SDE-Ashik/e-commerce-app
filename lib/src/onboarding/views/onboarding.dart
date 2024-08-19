

import 'package:fashion_app/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     body: Stack(
      children: [
        PageView(
     
          onPageChanged: (page) {
            context.read<OnboardingNotifier>().setSelectedPage =page;
          },
          children: [
            Center(child: Text("Page 1")),
            Center(child: Text("Page 2")),
              Center(child: Text("Page 6")),
              Center(child: Text("Page 4")),

          ],
        )
      ],
     ),

    );

  }
}
