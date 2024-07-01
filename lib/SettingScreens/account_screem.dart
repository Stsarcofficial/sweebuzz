import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Account',
          style: TextStyle(color: Color.fromARGB(255, 226, 115, 64)),
        ),
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: Color.fromARGB(255, 226, 115, 64)),
          onPressed: () {
            Navigator.pop(context);// Handle back button press
          },
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          PersonalInformation(),
          Saved(),
          AccountStatus(),
          Language(),
          Captions(),
          BrowserSettings(),
          SensitiveContentControl(),
          ContactsSyncing(),
          SharingToOtherApps(),
          MobileDataUse(),
          OriginalPosts(),
          RequestVerification(),
          ReviewActivity(),
          BrandedContent(),
        ],
      ),
    );
  }
}

class PersonalInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Personal Information');
  }
}

class Saved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Saved');
  }
}

class AccountStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Account Status');
  }
}

class Language extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Language');
  }
}

class Captions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Captions');
  }
}

class BrowserSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Browser settings');
  }
}

class SensitiveContentControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Sensitive content control');
  }
}

class ContactsSyncing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Contacts syncing');
  }
}

class SharingToOtherApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Sharing to other apps');
  }
}

class MobileDataUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Mobile data use');
  }
}

class OriginalPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Original posts');
  }
}

class RequestVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Request verification');
  }
}

class ReviewActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Review activity');
  }
}

class BrandedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountOptionItem(title: 'Branded Content');
  }
}

class AccountOptionItem extends StatelessWidget {
  final String title;

  const AccountOptionItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 18), // Adjusted padding
          title: Text(
            title,
            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),
          ),
          onTap: () {
            // Handle item tap
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(
            height: 0,
            color: Color.fromARGB(37, 226, 115, 64),
          ),
        ),
      ],
    );
  }
}
