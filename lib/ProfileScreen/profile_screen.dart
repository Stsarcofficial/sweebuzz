import 'package:flutter/material.dart';
import 'package:sweebuzz/HomeScreen/home_screen.dart';
import 'package:sweebuzz/ProfileScreen/Editprofile_screen.dart';
import 'package:sweebuzz/ProfileScreen/glimpse_screen.dart';
import 'package:sweebuzz/SettingScreens/setting_screen.dart';

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
  final PageController _pageController = PageController(initialPage: 2);

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _onMenuItemSelected(String value) {
    // Handle the selected menu item here
    switch (value) {
      case 'settings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
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
                      Icon(Icons.settings,
                          color: Color.fromARGB(255, 226, 115, 64)),
                      SizedBox(width: 10),
                      Text("Settings"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'share_profile',
                  child: Row(
                    children: const [
                      Icon(Icons.share_outlined,
                          color: Color.fromARGB(255, 226, 115, 64)),
                      SizedBox(width: 10),
                      Text("Share profile"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'saved',
                  child: Row(
                    children: const [
                      Icon(Icons.bookmark,
                          color: Color.fromARGB(255, 226, 115, 64)),
                      SizedBox(width: 10),
                      Text("Saved"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: Row(
                    children: const [
                      Icon(Icons.logout,
                          color: Color.fromARGB(255, 226, 115, 64)),
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
      body: Column(
        children: [
          _profileHeader(),
          _profileStats(),
          _profileTabs(),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              children: const [
                BlogsContent(),
                VlogsContent(),
                PostsContent(),
                VibesContent(),
              ],
            ),
          ),
        ],
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
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
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
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: Text(
            "Keep your face always toward the sunshine, and shadows will fall behind you.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFFf3d8d0), // Light background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 0, // Remove elevation
              ),
              child: const Text(
                "Edit Profile",
                style: TextStyle(
                    color:
                        Color.fromARGB(255, 226, 115, 64)), // Orange text color
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditGlimpsePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFFf3d8d0), // Orange background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 0, // Remove elevation
              ),
              child: const Text(
                "Edit Glimpse",
                style: TextStyle(
                    color:
                        Color.fromARGB(255, 226, 115, 64)), // Orange text color
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
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w100),
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

  // Widget _profileContent() {
  //   switch (_selectedTabIndex) {
  //     case 0:
  //       return const BlogsContent();
  //     case 1:
  //       return const VlogsContent();
  //     case 2:
  //       return const PostsContent();
  //     case 3:
  //       return VibesContent();
  //     default:
  //       return const PostsContent();
  //   }
  // }
}

class BlogsContent extends StatelessWidget {
  const BlogsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> imageData = [
      {
        'url': 'assets/images/img_rectangle250_819x414.png',
        'text': 'A traveler\'s Diary'
      },
      {'url': 'assets/images/img_rectangle169.png', 'text': 'Image 2'},
      {'url': 'assets/images/img_rectangle168.png', 'text': 'Image 3'},
      {'url': 'assets/images/img_27745327513096_5.png', 'text': 'Image 4'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 5'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 7'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 8'},
    ];

    return PageView(  
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 12, top: 13),
          child: GridView.count(
            childAspectRatio: 1.3,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: List.generate(imageData.length, (index) {
              return InkWell(
                onTap: () {
                  // Add your navigation logic here
                  // For example, navigate to a detail page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlogDetailPage(
                        imageUrl: imageData[index]['url']!,
                        title: imageData[index]['text']!,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.darken,
                            ),
                            image: AssetImage(
                              imageData[index]['url']!,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                imageData[index]['text']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "outfit",
                                  color: Colors.white,
                                ),
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "4.5 k",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: "outfit",
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    "10 min",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: "outfit",
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class BlogDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;

  const BlogDetailPage(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Image.asset(imageUrl),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Detailed content about $title goes here.',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class VlogsContent extends StatelessWidget {
  const VlogsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> imageData = [
      {
        'url': 'assets/images/img_rectangle172.png',
        'text': 'Ancient Roman amphitheater, a landmark'
      },
      {
        'url': 'assets/images/img_rectangle169.png',
        'text': 'World of engineering'
      },
      {'url': 'assets/images/img_rectangle168.png', 'text': 'Image 3'},
      {'url': 'assets/images/img_27745327513096_5.png', 'text': 'Image 4'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 5'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 7'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 8'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 9'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 10'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 11'},
    ];

    return PageView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8, right: 12, top: 13),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
            ),
            itemCount: imageData.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VlogDetailPage(
                        imageUrl: imageData[index]['url']!,
                        title: imageData[index]['text']!,
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.darken,
                            ),
                            image: AssetImage(imageData[index]['url']!),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 8,
                        right: 2,
                        child: Row(
                          children: [
                            const Icon(Icons.play_circle, color: Colors.white),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  imageData[index]['text']!,
                                  softWrap: true,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "outfit",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class VlogDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;

  const VlogDetailPage(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Image.asset(imageUrl),
      ),
    );
  }
}

class PostsContent extends StatelessWidget {
  const PostsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfilePostsGrid();
  }
}

class VibesContent extends StatelessWidget {
  const VibesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> imageData = [
      {'url': 'assets/images/img_rectangle155.png', 'views': '20k views'},
      {'url': 'assets/images/img_rectangle156.png', 'views': '30k views'},
      {'url': 'assets/images/img_rectangle157.png', 'views': '1M views'},
      {'url': 'assets/images/img_rectangle158.png', 'views': '200k views'},
      {'url': 'assets/images/img_rectangle159.png', 'views': '160k views'},
      {'url': 'assets/images/img_rectangle160.png', 'views': '530k views'},
      {'url': 'assets/images/img_rectangle161.png', 'views': '350k views'},
      {'url': 'assets/images/img_rectangle162.png', 'views': '160k views'},
      {'url': 'assets/images/img_rectangle163.png', 'views': '1.2M views'},
    ];

    return PageView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            padding: const EdgeInsets.only(left: 7, right: 7, top: 10),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 126 / 237,
            ),
            itemCount: imageData.length,
            itemBuilder: (context, index) {
              final item = imageData[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to detail page for the selected item
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VibesDetailPage(
                        imageUrl: item['url']!,
                        views: item['views']!,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: [
                      Container(
                        height: 237,
                        width: 126,
                        child: Image.asset(
                          item['url']!,
                          color: Colors.black.withOpacity(0.3),
                          colorBlendMode: BlendMode.darken,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey,
                              child: const Center(
                                child: Icon(Icons.error, color: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        left: 4,
                        child: Container(
                          color: const Color.fromARGB(0, 0, 0, 0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          child: Text(
                            item['views']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class VibesDetailPage extends StatelessWidget {
  final String imageUrl;
  final String views;

  const VibesDetailPage({
    super.key,
    required this.imageUrl,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vibes Detail'),
      ),
      body: Column(
        children: [
          Image.asset(imageUrl),
          Text(views),
        ],
      ),
    );
  }
}

class ProfilePostsGrid extends StatelessWidget {
  final List<String> images = [
    'assets/images/img_rectangle195.png',
    'assets/images/img_rectangle195_173x188.png',
    'assets/images/img_rectangle196.png',
    'assets/images/img_rectangle197.png',
    'assets/images/img_rectangle196_173x188.png',
    'assets/images/img_rectangle198.png',
    'assets/images/img_rectangle195.png',
    'assets/images/img_rectangle195_173x188.png',
    'assets/images/img_rectangle196.png',
    'assets/images/img_rectangle197.png',
    'assets/images/img_rectangle196_173x188.png',
    'assets/images/img_rectangle198.png',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            padding: const EdgeInsets.only(left: 7, right: 7, top: 10),
            physics: const ScrollPhysics(),
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
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
