import 'package:flutter/material.dart';
import 'package:sweebuzz/HomeScreen/home_screen.dart';
import 'package:sweebuzz/NotificationScreen/Notification_Allpage.dart';
import 'package:sweebuzz/ProfileScreen/profile_screen.dart';
import 'package:sweebuzz/SettingScreens/Foll_inv_screen.dart';
import 'package:sweebuzz/SettingScreens/Foll_inv_screen.dart';
import 'package:sweebuzz/SettingScreens/account_screem.dart';
import 'package:sweebuzz/SettingScreens/notification_screen.dart';
import 'package:sweebuzz/SettingScreens/privacy_Screen.dart';
import 'package:sweebuzz/SettingScreens/security_screen.dart';
import 'package:sweebuzz/SettingScreens/theme_screen.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Settings',
            style: TextStyle(color: Color.fromARGB(255, 226, 115, 64))),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 226, 115, 64),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              width: double.infinity, // Adjust width as needed
              height: 40.0, // Adjust height as needed
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: Colors.grey), // Change hint text color to grey
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFededed),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.only(left: 8, right: 8)),
                FollowInviteFriendsTile(),
                NotificationsTile(),
                PrivacyTile(),
                SecurityTile(),
                AccountTile(),
                ThemeTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Divider(height: 1, color: Color.fromARGB(179, 250, 249, 249));
    return ListTile(
      leading: Icon(icon, color: Color.fromARGB(255, 226, 115, 64)),
      title: Text(title, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),),
      onTap: onTap,
    );
  }
}

class FollowInviteFriendsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Divider(height: 1, color: Color.fromARGB(179, 250, 249, 249));
    return SettingsTile(
      icon: Icons.group_add_outlined,
      title: 'Follow and invite friends',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FollowInviteFriendsPage()),
        );
      },
    );
  }
}

class NotificationsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Divider(height: 1, color: Color.fromARGB(179, 250, 249, 249));
    return SettingsTile(
      icon: Icons.notifications,
      title: 'Notifications',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingNotificationPage()),
        );
      },
    );
  }
}

class PrivacyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Divider(height: 1, color: Color.fromARGB(179, 250, 249, 249));
    return SettingsTile(
      icon: Icons.lock,
      title: 'Privacy',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PrivacyPage()),
        );
      },
    );
  }
}

class SecurityTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Divider(height: 1, color: Color.fromARGB(179, 250, 249, 249));
    return SettingsTile(
      icon: Icons.security,
      title: 'Security',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecurityPage()),
        );
      },
    );
  }
}

class AccountTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Divider(height: 1, color: Color.fromARGB(179, 250, 249, 249));
    return SettingsTile(
      icon: Icons.account_circle,
      title: 'Account',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountPage()),
        );
      },
    );
  }
}

class ThemeTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Divider(height: 1, color: Color.fromARGB(179, 250, 249, 249));
    return SettingsTile(
      icon: Icons.invert_colors_on,
      title: 'Theme',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ThemePage(themeMode: ThemeMode.system, onThemeChanged: (ThemeMode onTap) { ThemeData.dark(); },)),
        );
      },
    );
  }
}
