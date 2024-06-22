import 'package:flutter/material.dart';
import 'package:sweebuzz/HomeScreen/home_screen.dart';
import 'package:sweebuzz/LoginScreen/login_screen.dart';
import 'package:sweebuzz/LoginScreen/signup_screen.dart';
import 'package:sweebuzz/LoginScreen/create_acc_acreen.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:sweebuzz/NotificationScreen/Notification_Allpage.dart';

Future<void> main() async {
  runApp(MyApp());
  await FlutterDisplayMode.setHighRefreshRate();
}

class MyApp extends StatelessWidget {
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
      home: const LoginPage(), // Set the new home screen here
      debugShowCheckedModeBanner: false,
    );
  }
}
   
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: NotificationsPage(),
//     );
//   }
// }

