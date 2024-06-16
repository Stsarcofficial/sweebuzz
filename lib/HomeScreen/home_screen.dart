import 'package:flutter/material.dart';
import '../AddScreen/add_page.dart';
import '../SearchScreen/search_screen.dart';

import '../ProfileScreen/profile_screen.dart';
import '../VlogScreen/vlog_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeContent(),
    const SearchPage(),
    const AddPage(),
    const VlogPage(),
    const ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Color.fromARGB(255, 226, 115, 64),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.message,
                color: Color.fromARGB(255, 226, 115, 64),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        selectedItemColor: Color.fromARGB(255, 235, 118, 64),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Vlog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
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
    return Column(
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
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () => onCategoryChanged(0),
            child: const Text('Posts'),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => onCategoryChanged(1),
            child: const Text('Vlogs'),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => onCategoryChanged(2),
            child: const Text('Blogs'),
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/img_27745327513096_2.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Post Title ${index + 1}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text('Post Description ${index + 1}'),
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

