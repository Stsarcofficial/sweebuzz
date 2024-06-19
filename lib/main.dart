import 'package:flutter/material.dart';
import 'package:sweebuzz/HomeScreen/home_screen.dart';

import 'package:flutter_displaymode/flutter_displaymode.dart';

Future<void> main() async {
  runApp(const MyApp());
  await FlutterDisplayMode.setHighRefreshRate();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        chipTheme: ChipThemeData(
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide.none, // Remove border
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(), // Set the new home screen here
      debugShowCheckedModeBanner: false,
    );
  }
}
