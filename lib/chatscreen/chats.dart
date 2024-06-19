import 'package:flutter/material.dart';
import 'package:sweebuzz/chatscreen/PinEntryScreen.dart';
import 'package:sweebuzz/chatscreen/ChatConversationScreen.dart';
import 'package:sweebuzz/HomeScreen/home_screen.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Chatscreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ChatsPage(),
    const GroupsPage(),
    const RequestsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showPinEntryScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PinEntryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: const Text('BuzzBox'),
        actions: [
          IconButton(
            icon: const Icon(Icons.remove_red_eye_outlined),
            onPressed: _showPinEntryScreen,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 80, 0, 0),
                items: [
                  const PopupMenuItem(
                    child: Text('Select Group'),
                  ),
                  const PopupMenuItem(
                    child: Text('Create Group'),
                  ),
                  const PopupMenuItem(
                    child: Text('Change Password'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Requests',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SearchBar(),
        ChatItem(
          name: 'Tokyo',
          message: 'New Messages',
          avatar: 'assets/tokyo.jpg',
          notificationCount: 10,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatConversationScreen()),
          ),
        ),
        ChatItem(
          name: 'Josh',
          message: 'New Messages',
          avatar: 'assets/josh.jpg',
          notificationCount: 15,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatConversationScreen()),
          ),
        ),
        ChatItem(
          name: 'May',
          message: 'okay..',
          avatar: 'assets/may.jpg',
        ),
        ChatItem(
          name: 'MJ',
          message: 'see you soon',
          avatar: 'assets/mj.jpg',
        ),
        ChatItem(
          name: 'Happy',
          message: 'hello there',
          avatar: 'assets/happy.jpg',
        ),
        ChatItem(
          name: 'Pepper',
          message: 'hello there',
          avatar: 'assets/pepper.jpg',
        ),
        ChatItem(
          name: 'Liz',
          message: 'hello there',
          avatar: 'assets/liz.jpg',
        ),
        ChatItem(
          name: 'Stark',
          message: 'hello there',
          avatar: 'assets/stark.jpg',
        ),
      ],
    );
  }
}

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SearchBar(),
        ChatItem(
          name: 'Marvel',
          message: 'New Messages',
          avatar: 'assets/marvel.jpg',
          isNew: true,
        ),
        ChatItem(
          name: 'Group oldschool',
          message: 'New Messages',
          avatar: 'assets/group_oldschool.jpg',
          notificationCount: 15,
        ),
        ChatItem(
          name: 'Clg 2023',
          message: 'okay..',
          avatar: 'assets/clg2023.jpg',
        ),
      ],
    );
  }
}

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Requests Page'),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String avatar;
  final int? notificationCount;
  final bool isNew;
  final VoidCallback? onTap;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.avatar,
    this.notificationCount,
    this.isNew = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(avatar),
          ),
          if (isNew)
            Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: Colors.red,
              ),
            ),
        ],
      ),
      title: Text(name),
      subtitle: Text(message),
      trailing: notificationCount != null
          ? CircleAvatar(
        radius: 12,
        backgroundColor: Colors.red,
        child: Text(
          '$notificationCount',
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      )
          : null,
      onTap: onTap,
    );
  }
}
