import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Security', style: TextStyle(color: Color.fromARGB(255, 226, 115, 64))),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 226, 115, 64)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20,),
          Text('Login security', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Poppins')),
          SizedBox(height:10),
          _buildSecurityOption(
            context,
            Icons.key_outlined,
            'Password',
            () {
              // Navigate to Password page
              Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordPage()));
            },
          ),
          _buildSecurityOption(
            context,
            Icons.login,
            'Login activity',
            () {
              // Navigate to Login activity page
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginActivityPage()));
            },
          ),
          _buildSecurityOption(
            context,
            Icons.save_outlined,
            'Saved login information',
            () {
              // Navigate to Saved login information page
              Navigator.push(context, MaterialPageRoute(builder: (context) => SavedLoginInfoPage()));
            },
          ),
          _buildSecurityOption(
            context,
            Icons.phonelink_lock,
            'Two-factor authentication',
            () {
              // Navigate to Two-factor authentication page
              Navigator.push(context, MaterialPageRoute(builder: (context) => TwoFactorAuthPage()));
            },
          ),
          _buildSecurityOption(
            context,
            Icons.email_outlined,
            'Emails from Sweebuzz',
            () {
              // Navigate to Emails from Sweebuzz page
              Navigator.push(context, MaterialPageRoute(builder: (context) => EmailsFromSweebuzzPage()));
            },
          ),
          _buildSecurityOption(
            context,
            Icons.security,
            'Security Checkup',
            () {
              // Navigate to Security Checkup page
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecurityCheckupPage()));
            },
          ),
          Divider(height: 40, thickness: 1, color: Color.fromARGB(37, 226, 115, 64),),
          Text('Data and history', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Poppins')),
          SizedBox(height: 10),
          _buildSecurityOption(
            context,
            Icons.devices,
            'Apps and websites',
            () {
              // Navigate to Apps and websites page
              Navigator.push(context, MaterialPageRoute(builder: (context) => AppsAndWebsitesPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityOption(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0),
      leading: Icon(icon, color: Color.fromARGB(255, 226, 115, 64)),
      title: Text(title, style: TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
      onTap: onTap,
    );
  }
}

// Placeholder pages for navigation
class PasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Password')));
  }
}

class LoginActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Login activity')));
  }
}

class SavedLoginInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Saved login information')));
  }
}

class TwoFactorAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Two-factor authentication')));
  }
}

class EmailsFromSweebuzzPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Emails from Sweebuzz')));
  }
}

class SecurityCheckupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Security Checkup')));
  }
}

class AppsAndWebsitesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Apps and websites')));
  }
}