import 'package:flutter/material.dart';
import 'package:sweebuzz/SettingScreens/setting_screen.dart';

class SettingNotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: TextStyle(
              color: Color.fromARGB(255, 226, 115, 64),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: Color.fromARGB(255, 226, 115, 64)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text('Pause all'),
            trailing: Transform.scale(
              scale:0.7, // Adjust this scale value to make the switch smaller or larger
              child: Switch(
                value: true,
                onChanged: (bool value) {},
                inactiveThumbColor: Color.fromARGB(132, 226, 115, 64), // Color of the switch thumb when false
                inactiveTrackColor: const Color.fromARGB(255, 248, 248, 248).withOpacity(0.3),
                activeColor: Color.fromARGB(255, 226, 115, 64), // Color of the switch track when false
              ),
            ),
          ),
          ListTile(
            title: Text('Posts, stories and comments'),
            onTap: () {
              // Handle posts, stories and comments tap
            },
          ),
          ListTile(
            title: Text('Following and followers'),
            onTap: () {
              // Handle following and followers tap
            },
          ),
          ListTile(
            title: Text('Messages and calls'),
            onTap: () {
              // Handle messages and calls tap
            },
          ),
          ListTile(
            title: Text('Live and vibes'),
            onTap: () {
              // Handle live and vibes tap
            },
          ),
          ListTile(
            title: Text('Email Notifications'),
            onTap: () {
              // Handle email notifications tap
            },
          ),
        ],
      ),
    );
  }
}
