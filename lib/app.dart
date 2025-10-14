import 'package:bio_authentication/presentation/screen/bio_authentication_home_screen.dart';
import 'package:flutter/material.dart';

class BioAuthenticationApp extends StatelessWidget {
  const BioAuthenticationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bio-Authentication',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BioAuthenticationHomeScreen(),
    );
  }
}
