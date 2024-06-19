import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
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

  // Define icon properties
  final Color selectedColor =
      const Color.fromARGB(255, 235, 118, 64); // Orange color for selected icon
  final Color unselectedColor = Colors.grey; // Grey color for unselected icons
  final double iconSize = 35.0; // Icon size

  final List<Widget> pages = [
    const HomeContent(),
    const SearchPage(),
    const AddPage(),
    const VlogPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0, // No shadow
        color: Colors.white, // Background color
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
        if (index != 2) {
          setState(() {
            currentIndex = index;
          });
        } else {
          showModalBottomSheet<void>(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  height: 270,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.9,
                      colors: [
                        const Color.fromARGB(255, 235, 118, 64)
                            .withOpacity(0.9),
                        const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.4)
                      ],
                      stops: const [0.2, 1.0],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Badge(
                        backgroundColor:
                            const Color.fromARGB(255, 235, 118, 64),
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
                                  borderRadius: BorderRadius.circular(19)),
                              alignment: Alignment.topCenter,
                              foregroundColor:
                                  Color.fromARGB(255, 235, 118, 64),
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.only(
                                  bottom: 13, top: 6, left: 17, right: 17),
                              minimumSize: const Size(0, 0),
                            ),
                            child: const Text(
                              "Story",
                              style: TextStyle(fontSize: 16),
                            ),
                            onPressed: () {}),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Post",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Icon(
                            Icons.app_blocking_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Blog",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Vlog",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Icon(
                            Icons.app_blocking_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
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
                );
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
              onTap: () {},
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Chatscreen()));
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
          const TopStories(),
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
  const TopStories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
              image: const DecorationImage(
                image: AssetImage('assets/images/img_rectangle148.png'),
                fit: BoxFit.cover,
              ),
            ),
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
                  fontSize: 17,
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
                    fontSize: 17,
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
                  fontSize: 17,
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

  const PostCard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 10,
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
                "assets/images/img_rectangle60.png",
                height: 40,
                width: 40,
              ),
              title: Row(
                verticalDirection: VerticalDirection.up,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Virat Kohli",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: "poppins"),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const Text("5 min ago",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'outfit',
                          fontWeight: FontWeight.w300)),
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
                      fontSize: 10,
                      fontFamily: 'outfit',
                      fontWeight: FontWeight.w300)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/img_group1531.png"))),
            ),
            const SizedBox(height: 10),
            Text(
              'Post Title ${index + 1}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Post Description ${index + 1}'),
            const SizedBox(height: 10),
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
                      style:
                          TextStyle(color: Color.fromARGB(255, 235, 118, 64)),
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
                    const Text("200k")
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
                    Text("14k")
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
