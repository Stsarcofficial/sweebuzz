import 'package:flutter/material.dart';
import 'package:sweebuzz/SettingScreens/setting_screen.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Privacy',
          style: TextStyle(color: Color.fromARGB(255, 226, 115, 64),fontFamily: 'Poppins', fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 226, 115, 64)),
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
          const SizedBox(height: 20,),
          Padding(padding: EdgeInsets.only()),
          ListTile(
            leading: Icon(Icons.lock, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Private Account',
              style: TextStyle(fontSize: 16),
            ),
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
          Divider(color: Color.fromARGB(19, 226, 115, 64)),
          ListTile(
            leading: Icon(Icons.email, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Limits',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle limits tap
            },
          ),
          ListTile(
            leading: Icon(Icons.visibility_off, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Hidden words',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle hidden words tap
            },
          ),
          ListTile(
            leading: Icon(Icons.add_circle_outline_rounded, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Posts',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle posts tap
            },
          ),
          ListTile(
            leading: Icon(Icons.alternate_email, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Mentions',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle mentions tap
            },
          ),
          ListTile(
            leading: Icon(Icons.web_stories_outlined, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Story',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle story tap
            },
          ),
          ListTile(
            leading: Icon(Icons.ondemand_video_rounded , color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Live',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle live tap
            },
          ),
          ListTile(
            leading: Icon(Icons.face_6_outlined, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Activity Status',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle activity status tap
            },
          ),
          ListTile(
            leading: Icon(Icons.message_outlined, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Messages',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle messages tap
            },
          ),
          Divider(color: Color.fromARGB(19, 226, 115, 64)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: Text(
              'Connections',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.no_accounts_outlined, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Restricted accounts',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle restricted accounts tap
            },
          ),
          ListTile(
            leading: Icon(Icons.block, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Blocked accounts',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle blocked accounts tap
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_off_outlined, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Muted accounts',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle muted accounts tap
            },
          ),
          ListTile(
            leading: Icon(Icons.group_outlined, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text(
              'Accounts you follow',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle accounts you follow tap
            },
          ),
        ],
      ),
    );
  }
}
