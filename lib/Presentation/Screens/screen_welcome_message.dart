import 'package:flutter/material.dart';
import 'package:minebrat/Presentation/Widgets/name_gender.dart';

class WelcomeScreen extends StatelessWidget {
  final String stateName;
  final String cityName;
  const WelcomeScreen(
      {super.key, required this.stateName, required this.cityName});

  @override
  Widget build(BuildContext context) {
    final userName = nameGender.userName;
    //String userName = nameAndGender.userName;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Container(
          color: Colors.white,
          height: 300,
          width: 300,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              "Dear Mr/Ms $userName, you are from $cityName in $stateName, India",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
