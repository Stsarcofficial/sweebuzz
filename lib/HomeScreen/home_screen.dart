import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sweebuzz/NotificationScreen/Notification_Allpage.dart';
import '../AddScreen/add_page.dart';
import '../SearchScreen/search_screen.dart';
import '../ProfileScreen/profile_screen.dart';
import '../VlogScreen/vlog_screen.dart';
import 'package:sweebuzz/chatscreen/chats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  bool video = false;
  // Define icon properties
  final Color selectedColor =
      const Color.fromARGB(255, 235, 118, 64); // Orange color for selected icon
  final Color unselectedColor = Colors.grey; // Grey color for unselected icons
  final double iconSize = 30.0; // Icon size

  late List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    pages = [
      const HomeContent(),
      const SearchPage(),
      const AddPage(),
      VlogPage(
        video: video,
      ),
      const ProfilePage(),
    ];
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0, // No shadow
        height: 65,
        color: Colors.white, // Background color
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildBottomNavItem(Icons.home, 0),
              const SizedBox(width: 20.0), // Adjust the width between icons
              buildBottomNavItem(Icons.search, 1),
              const SizedBox(width: 20.0),
              buildBottomNavItem(Icons.add, 2),
              const SizedBox(width: 20.0),
              buildBottomNavItem(Icons.video_library, 3),
              const SizedBox(width: 20.0),
              buildBottomNavItem(Icons.person, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavItem(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        size: iconSize,
        color: currentIndex == index ? selectedColor : unselectedColor,
      ),
      onPressed: () {
        if (index == 3) {
          setState(() {
            video = true;
          });
        } else {
          setState(() {
            video = false;
          });
        }
        if (index != 2) {
          setState(() {
            currentIndex = index;
          });
        } else {
          showModalBottomSheet<void>(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                    height: 280,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 7,
                            width: 120,
                            color: const Color(0xFFE66137),
                          ),
                          Container(
                            width: double.infinity,
                            height: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: RadialGradient(
                                radius: 0.9,
                                colors: [
                                  const Color(0xFFE66137).withOpacity(0.7),
                                  const Color.fromARGB(255, 255, 255, 255)
                                      .withOpacity(0.5)
                                ],
                                stops: const [0, 9],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Badge(
                                  backgroundColor: const Color(0xFFE66137),
                                  offset: const Offset(4, 10),
                                  label: const Icon(
                                    Icons.add,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  largeSize: 25,
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        alignment: Alignment.topCenter,
                                        foregroundColor:
                                            const Color(0xFFE66137),
                                        backgroundColor: Colors.white,
                                        padding: const EdgeInsets.only(
                                            bottom: 10, left: 17, right: 17),
                                        minimumSize: const Size(0, 0),
                                      ),
                                      child: const Text(
                                        "Story",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Palanquin",
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onPressed: () {}),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/img_user_primarycontainer.svg",
                                      height: 27,
                                      width: 27,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Post",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 80,
                                    ),
                                    Container(
                                        height: 27,
                                        width: 27,
                                        alignment: Alignment.topCenter,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 0),
                                        child: const Text(
                                          "B",
                                          style: TextStyle(
                                              fontFamily: "pottaoneregular",
                                              color: Color(0xFFE66137),
                                              fontSize: 20),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Blog",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 27,
                                        width: 27,
                                        alignment: Alignment.topCenter,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 0),
                                        child: const Text(
                                          "V",
                                          style: TextStyle(
                                              fontFamily: "pottaoneregular",
                                              color: const Color(0xFFE66137),
                                              fontSize: 20),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Vlog",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      width: 60,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 18.0),
                                      child: Container(
                                        height: 27,
                                        width: 27,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 7,
                                        ),
                                        child: SvgPicture.asset(
                                          "assets/images/img_videocamera.svg",
                                          height: 13,
                                          width: 13,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Vibe",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ]));
              });
        }
      },
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            const Text(
              'SweeBuzz',
              style: TextStyle(
                color: Color.fromARGB(255, 226, 115, 64),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );
              },
              child: SvgPicture.asset(
                "assets/images/img_notification.svg",
                height: 23,
                width: 23,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Chatscreen()));
              },
              child: SvgPicture.asset(
                "assets/images/img_message2.svg",
                height: 25,
                width: 25,
              ),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopStories(),
          CategoryButtons(
            currentIndex: currentIndex,
            onCategoryChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Expanded(
            child: ContentList(currentIndex: currentIndex),
          ),
        ],
      ),
    );
  }
}

class TopStories extends StatelessWidget {
  final List<String> stories = [
    "assets/images/img_rectangle148.png",
    "assets/images/img_rectangle129_1.png",
    "assets/images/img_rectangle136.png",
    "assets/images/img_rectangle139.png",
    "assets/images/img_rectangle141.png",
    "assets/images/img_rectangle125.png",
    "assets/images/img_rectangle134.png",
    "assets/images/img_rectangle133.png",
    "assets/images/img_rectangle132_121x121.png"
  ];
  TopStories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(stories.length, (index) {
          return index != 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 70,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: const Color.fromARGB(255, 235, 118, 64),
                            width: 1.5),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.1), BlendMode.darken),
                          image: AssetImage(stories[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Badge(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      offset: const Offset(0, 10),
                      label: const Icon(
                        Icons.add,
                        size: 15,
                        weight: 10,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      largeSize: 25,
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.1),
                                BlendMode.darken),
                            image: AssetImage(stories[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}

class CategoryButtons extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onCategoryChanged;

  const CategoryButtons({
    required this.currentIndex,
    required this.onCategoryChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 5, top: 5),
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                minimumSize: const Size(0, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: currentIndex == 0
                    ? const Color.fromARGB(255, 79, 79, 79)
                    : Colors.transparent,
                foregroundColor: currentIndex == 0
                    ? Colors.white
                    : const Color.fromARGB(255, 79, 79, 79)),
            onPressed: () => onCategoryChanged(0),
            child: const Text(
              'Posts',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'outfit',
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                minimumSize: const Size(0, 0),
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: currentIndex == 1
                    ? const Color.fromARGB(255, 79, 79, 79)
                    : Colors.transparent,
                foregroundColor: currentIndex == 1
                    ? Colors.white
                    : const Color.fromARGB(255, 79, 79, 79)),
            onPressed: () => onCategoryChanged(1),
            child: const Text('Vlogs',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'outfit',
                    fontWeight: FontWeight.w500)),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                minimumSize: const Size(0, 0),
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: currentIndex == 2
                    ? const Color.fromARGB(255, 79, 79, 79)
                    : Colors.transparent,
                foregroundColor: currentIndex == 2
                    ? Colors.white
                    : const Color.fromARGB(255, 79, 79, 79)),
            onPressed: () => onCategoryChanged(2),
            child: const Text(
              'Blogs',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'outfit',
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}

class ContentList extends StatelessWidget {
  final int currentIndex;

  const ContentList({
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          switch (currentIndex) {
            case 0:
              return PostCard(index: index);
            case 1:
              return VlogCard(index: index);
            case 2:
              return BlogCard(index: index);
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final int index;

  PostCard({required this.index, super.key});
  final List<Map<String, String>> Imagedata = [
    {
      'pfp': 'assets/images/img_rectangle60.png',
      'url': 'assets/images/img_group1531.png',
    },
    {
      'pfp': 'assets/images/img_rectangle60.png',
      'url': 'assets/images/img_group1531.png',
    },
    {
      'pfp': 'assets/images/img_rectangle60.png',
      'url': 'assets/images/img_group1531.png',
    },
    {
      'pfp': 'assets/images/img_rectangle60.png',
      'url': 'assets/images/img_group1531.png',
    },
    {
      'pfp': 'assets/images/img_rectangle60.png',
      'url': 'assets/images/img_group1531.png',
    },
    {
      'pfp': 'assets/images/img_rectangle60.png',
      'url': 'assets/images/img_group1531.png',
    },
    {
      'pfp': 'assets/images/img_rectangle60.png',
      'url': 'assets/images/img_group1531.png',
    },
    {
      'pfp': 'assets/images/img_rectangle60.png',
      'url': 'assets/images/img_group1531.png',
    },
    {
      'pfp': 'assets/images/img_rectangle60.png',
      'url': 'assets/images/img_group1531.png',
    },
    {
      'pfp': 'assets/images/img_rectangle60.png',
      'url': 'assets/images/img_group1531.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Image.asset(
                Imagedata[index]["pfp"]!,
                height: 40,
                width: 40,
              ),
              title: Row(
                verticalDirection: VerticalDirection.up,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "virat kohli",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins"),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: Text("5 min ago",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'outfit',
                            fontWeight: FontWeight.w300)),
                  ),
                  SvgPicture.asset(
                    "assets/images/img_save11.svg",
                    color: const Color.fromARGB(255, 75, 75, 75),
                  ),
                  const Icon(
                    Icons.more_vert,
                    size: 25,
                  ),
                ],
              ),
              subtitle: const Text("India",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'outfit',
                      fontWeight: FontWeight.w300)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Imagedata[index]["url"]!))),
            ),
            const SizedBox(height: 10),
            const Text(
              'OFF THE MARK ✅',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  fontFamily: "poppins"),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  '@royalchallangersbanglore ',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w200,
                      fontFamily: "poppins"),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "read more...",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                        fontFamily: "poppins"),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Column(
                  children: [
                    Icon(
                      Icons.emoji_emotions_outlined,
                      size: 26,
                      color: Color.fromARGB(255, 235, 118, 64),
                    ),
                    Text(
                      "10M",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 235, 118, 64),
                          fontFamily: "poppins"),
                    )
                  ],
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/images/img_chat1_black_900.svg",
                      height: 25,
                      width: 25,
                    ),
                    const Text(
                      "200k",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: "poppins"),
                    )
                  ],
                ),
                const SizedBox(
                  width: 14,
                ),
                const Column(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      size: 26,
                    ),
                    Text(
                      "14k",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: "poppins"),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VlogCard extends StatelessWidget {
  final int index;

  const VlogCard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/img_27745327513096_4.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Vlog Title ${index + 1}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text('Vlog Description ${index + 1}'),
          ],
        ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final int index;

  const BlogCard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/img_27745327513096_221x326.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Blog Title ${index + 1}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text('Blog Description ${index + 1}'),
          ],
        ),
      ),
    );
  }
}
