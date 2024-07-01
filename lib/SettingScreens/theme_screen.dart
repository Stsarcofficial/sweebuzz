import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemePage extends StatelessWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChanged;

  ThemePage({required this.themeMode, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Set Theme',
          style: TextStyle(color: Color.fromARGB(255, 226, 115, 64)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 226, 115, 64),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Light'),
            trailing: Radio<ThemeMode>(
              value: ThemeMode.light,
              groupValue: themeMode,
              onChanged: (ThemeMode? value) {
                onThemeChanged(value!);
              },
              activeColor: Color.fromARGB(255, 226, 115, 64),
              fillColor: MaterialStateColor.resolveWith(
                (states) => Color.fromARGB(255, 226, 115, 64),
              ),
            ),
          ),
          ListTile(
            title: Text('Dark'),
            trailing: Radio<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: themeMode,
              onChanged: (ThemeMode? value) {
                onThemeChanged(value!);
              },
              activeColor: Color.fromARGB(255, 226, 115, 64),
              fillColor: MaterialStateColor.resolveWith(
                (states) => Color.fromARGB(255, 226, 115, 64),
              ),
            ),
          ),
          ListTile(
            title: Text('System Default'),
            trailing: Radio<ThemeMode>(
              value: ThemeMode.system,
              groupValue: themeMode,
              onChanged: (ThemeMode? value) {
                onThemeChanged(value!);
              },
              activeColor: Color.fromARGB(255, 226, 115, 64),
              fillColor: MaterialStateColor.resolveWith(
                (states) => Color.fromARGB(255, 226, 115, 64),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
