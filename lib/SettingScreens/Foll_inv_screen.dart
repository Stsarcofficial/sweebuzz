import 'package:flutter/material.dart';
import 'package:sweebuzz/SettingScreens/setting_screen.dart';

class FollowInviteFriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Follow and invite friends',
          style: TextStyle(color: Color.fromARGB(255, 226, 115, 64), fontFamily: 'Poppins', fontWeight: FontWeight.w600),
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            leading: Icon(Icons.person_add_alt_1_outlined,
                color: Color.fromARGB(255, 226, 115, 64)),
            title: Text('Follow Contacts'),
            onTap: () {
              // Handle follow contacts tap
            },
          ),
          Divider(height: 1, color: Color.fromARGB(179, 250, 249, 249)),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            leading:
                Icon(Icons.email, color: Color.fromARGB(255, 226, 115, 64)),
            title: Text('Invite friends by email'),
            onTap: () {
              // Handle invite friends by email tap
            },
          ),
          Divider(height: 1, color: Color.fromARGB(179, 250, 249, 249)),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            leading: Icon(Icons.sms_outlined,
                color: Color.fromARGB(255, 226, 115, 64)),
            title: Text('Invite friends via SMS'),
            onTap: () {
              // Handle invite friends via SMS tap
            },
          ),
          Divider(height: 1, color: Color.fromARGB(179, 250, 249, 249)),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            leading: Icon(Icons.share_outlined,
                color: Color.fromARGB(255, 226, 115, 64)),
            title: Text('Invite friends via...'),
            onTap: () {
              // Handle invite friends via... tap
            },
          ),
        ],
      ),
    );
  }
}
