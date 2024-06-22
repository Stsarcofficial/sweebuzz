import 'package:flutter/material.dart';
import 'package:sweebuzz/HomeScreen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        popupMenuTheme: PopupMenuThemeData(
          color: const Color(0xFFededed),
          textStyle: const TextStyle(color: Colors.black),
        ),
        menuTheme: MenuThemeData(
          style: MenuStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFFededed)),
          ),
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedTabIndex = 2; // Default to "Posts" tab

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _onMenuItemSelected(String value) {
    // Handle the selected menu item here
    switch (value) {
      case 'settings':
        // Navigate to Settings page
        break;
      case 'share_profile':
        // Share profile action
        break;
      case 'saved':
        // Navigate to Saved page
        break;
      case 'logout':
        // Perform logout action
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        title: const Text(
          "vini.r01",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onSelected: _onMenuItemSelected,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'settings',
                  child: Row(
                    children: const [
                      Icon(Icons.settings, color: Color.fromARGB(255, 226, 115, 64)),
                      SizedBox(width: 10),
                      Text("Settings"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'share_profile',
                  child: Row(
                    children: const [
                      Icon(Icons.share, color: Color.fromARGB(255, 226, 115, 64)),
                      SizedBox(width: 10),
                      Text("Share profile"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'saved',
                  child: Row(
                    children: const [
                      Icon(Icons.bookmark, color: Color.fromARGB(255, 226, 115, 64)),
                      SizedBox(width: 10),
                      Text("Saved"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: Row(
                    children: const [
                      Icon(Icons.logout, color: Color.fromARGB(255, 226, 115, 64)),
                      SizedBox(width: 10),
                      Text("Logout"),
                    ],
                  ),
                ),
              ];
            },
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profileHeader(),
            _profileStats(),
            _profileTabs(),
            _profileContent(),
          ],
        ),
      ),
    );
  }

  Widget _profileHeader() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage('assets/images/img_rectangle130_121x121.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Vini Roger",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Text(
            "Keep your face always toward the sunshine, and shadows will fall behind you.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFf3d8d0), // Light background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 0, // Remove elevation
              ),
              child: const Text(
                "Edit Profile",
                style: TextStyle(color: Color.fromARGB(255, 226, 115, 64)), // Orange text color
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFf3d8d0), // Orange background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 0, // Remove elevation
              ),
              child: const Text(
                "Edit Glimpse",
                style: TextStyle(color: Color.fromARGB(255, 226, 115, 64)), // Orange text color
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _profileStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statItem("20k", "Fans"),
          _statItem("250", "Following"),
          _statItem("40k", "Likes"),
        ],
      ),
    );
  }

  Widget _statItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w100),
        ),
      ],
    );
  }

  Widget _profileTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _tabItem("Blogs", 0),
          _tabItem("Vlogs", 1),
          _tabItem("Posts", 2),
          _tabItem("Vibes", 3),
        ],
      ),
    );
  }

  Widget _tabItem(String label, int index) {
    final bool isActive = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.black : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _blogsContent();
      case 1:
        return _vlogsContent();
      case 2:
        return _postsContent();
      case 3:
        return _vibesContent();
      default:
        return _postsContent();
    }
  }

  Widget _blogsContent() {
    return const Center(child: Text("Blogs content goes here"));
  }

  Widget _vlogsContent() {
    return const Center(child: Text("Vlogs content goes here"));
  }

  Widget _postsContent() {
    return _profilePostsGrid();
  }

  Widget _vibesContent() {
    return const Center(child: Text("Vibes content goes here"));
  }

  Widget _profilePostsGrid() {
    final List<String> images = [
      'assets/images/img_rectangle133_121x121.png',
      'assets/images/img_rectangle134.png',
      'assets/images/img_rectangle134_121x121.png',
      'assets/images/img_rectangle136.png',
      'assets/images/img_rectangle136_121x121.png',
      'assets/images/img_rectangle137.png',
      'assets/images/img_rectangle133_121x121.png',
      'assets/images/img_rectangle134.png',
      'assets/images/img_rectangle134_121x121.png',
      'assets/images/img_rectangle136.png',
      'assets/images/img_rectangle136_121x121.png',
      'assets/images/img_rectangle137.png',
      // Add more image paths as needed
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
