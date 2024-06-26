import 'package:flutter/material.dart';
import 'package:sweebuzz/HomeScreen/home_screen.dart';

void main() {
  runApp(const NotificationsPage());
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white, // Changed background color to white
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color.fromRGBO(251, 109, 72, 1.000)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            title: Text('Notifications', style: TextStyle(color: Color.fromRGBO(251, 109, 72, 1.000), fontWeight: FontWeight.bold)),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Container(
                color: const Color.fromRGBO(255, 255, 255, 1),
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(text: 'All'),
                    Tab(text: 'Requests'),
                    Tab(text: 'Likes'),
                    Tab(text: 'Mentions'),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              NotificationsList(), // Content for "All" tab
              RequestsTab(), // Content for "Requests" tab
              LikesTab(), // Placeholder for "Likes" tab
              MentionsTab(), // Placeholder for "Mentions" tab
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/img_ellipse35.png'),
              radius: 24, // Adjust as needed
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 1, // Border width
                  ),
                ),
              ),
            ),
            title: Text('Requests'),
            subtitle: Text('Bruce and 350 more'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          SectionTitle(title: "Today's Activity"),
          NotificationItem(
            icon: Icons.notifications_active,
            color: Color.fromRGBO(251, 109, 72, 1.000),
            text: 'Lisa and 120 others liked your post',
          ),
          NotificationItem(
            icon: Icons.notifications_active,
            color: Color.fromRGBO(251, 109, 72, 1.000),
            text: 'kane001 has requested to follow you',
          ),
          NotificationItem(
            icon: Icons.notifications,
            color: Colors.grey,
            text: 'sara mentioned you in a comment',
          ),
          SectionTitle(title: 'Last Week Activity'),
          NotificationItem(
            icon: Icons.notifications,
            color: Colors.grey,
            text: 'Lisa and 120 others liked your post',
          ),
          NotificationItem(
            icon: Icons.notifications,
            color: Colors.grey,
            text: 'kane001 has requested to follow you',
          ),
          NotificationItem(
            icon: Icons.notifications,
            color: Colors.grey,
            text: 'sara mentioned you in a comment',
          ),
          NotificationItem(
            icon: Icons.notifications,
            color: Colors.grey,
            text: 'sara mentioned you in a comment',
          ),
          NotificationItem(
            icon: Icons.notifications,
            color: Colors.grey,
            text: 'sara mentioned you in a comment',
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO(251, 109, 72, 1.000)),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const NotificationItem({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFededed),
          border: Border.all(color: const Color(0xFFededed)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          leading: Icon(icon, color: color),
          title: Text(text),
        ),
      ),
    );
  }
}

class RequestsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "Today"),
            RequestItem(
              userName: 'Bruce102',
              time: '2 min ago',
              avatarPath: 'assets/images/img_ellipse35.png',
            ),
            RequestItem(
              userName: 'Bruce102',
              time: '2 min ago',
              avatarPath: 'assets/images/img_ellipse16_1.png',
            ),
            SectionTitle(title: "Last Week"),
            RequestItem(
              userName: 'Bruce102',
              time: '2 min ago',
              avatarPath: 'assets/images/img_ellipse38.png',
            ),
            RequestItem(
              userName: 'Bruce102',
              time: '2 min ago',
              avatarPath: 'assets/images/img_ellipse41.png',
            ),
            RequestItem(
              userName: 'Bruce102',
              time: '2 min ago',
              avatarPath: 'assets/images/img_ellipse42.png',
            ),
            RequestItem(
              userName: 'Bruce102',
              time: '2 min ago',
              avatarPath: 'assets/images/img_ellipse48.png',
            ),
            RequestItem(
              userName: 'Bruce102',
              time: '2 min ago',
              avatarPath: 'assets/images/img_ellipse49.png',
            ),
            RequestItem(
              userName: 'Bruce102',
              time: '2 min ago',
              avatarPath: 'assets/images/img_ellipse50.png',
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'See all (351)',
                  style: TextStyle(
                    color: Color.fromRGBO(251, 109, 72, 1.000),
                  ),
                ),
              ),
            ),
            SectionTitle(title: "Suggestions"),
            SuggestionItem(
              userName: 'Steven joe',
              followers: '100k followers',
              avatarPath: 'assets/images/img_ellipse51.png',
            ),
            SuggestionItem(
              userName: 'Donald Rom',
              followers: '10k followers',
              avatarPath: 'assets/images/img_ellipse52.png',
            ),
            SuggestionItem(
              userName: 'Jonas Polar',
              followers: '24k followers',
              avatarPath: 'assets/images/img_ellipse53.png',
            ),
            SuggestionItem(
              userName: 'Martha Mike',
              followers: '18k followers',
              avatarPath: 'assets/images/img_ellipse54.png',
            ),
          ],
        ),
      ),
    );
  }
}

class RequestItem extends StatelessWidget {
  final String userName;
  final String time;
  final String avatarPath;

  const RequestItem({
    required this.userName,
    required this.time,
    required this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEDEDED), // #ededed color
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(avatarPath),
            radius: 24,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(time, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Container(
            width: 85,
            height: 30,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Color.fromRGBO(251, 109, 72, 1.000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                'Accept',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            width: 85,
            height: 30,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                'Reject',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestionItem extends StatelessWidget {
  final String userName;
  final String followers;
  final String avatarPath;

  const SuggestionItem({
    required this.userName,
    required this.followers,
    required this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatarPath),
                radius: 24,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    Text(followers, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Container(
                width: 87,
                height: 34,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Color.fromRGBO(251, 109, 72, 1.000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'Follow',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey[300], thickness: 1),
      ],
    );
  }
}

class LikesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "Today"),
            LikeItem(
              userName: 'Lisa and 120 others',
              action: 'liked your post',
              time: '2 min',
              avatarPath: 'assets/images/img_ellipse35.png',
            ),
            LikeItem(
              userName: 'Merry and 119 others',
              action: 'liked your post',
              time: '3 hour',
              avatarPath: 'assets/images/img_ellipse35.png',
            ),
            SectionTitle(title: "Last Week"),
            LikeItem(
              userName: 'chris and 118 others',
              action: 'liked your post',
              time: '',
              avatarPath: 'assets/images/img_ellipse35.png',
            ),
            LikeItem(
              userName: 'furry',
              action: 'liked your post',
              time: '',
              avatarPath: 'assets/images/img_ellipse35.png',
            ),
            LikeItem(
              userName: 'steve',
              action: 'liked your post',
              time: '',
              avatarPath: 'assets/images/img_ellipse35.png',
            ),
            LikeItem(
              userName: 'jordeen',
              action: 'liked your comment',
              time: '',
              avatarPath: 'assets/images/img_ellipse35.png',
            ),
            LikeItem(
              userName: 'kane',
              action: 'liked your comment',
              time: '',
              avatarPath: 'assets/images/img_ellipse35.png',
            ),
            LikeItem(
              userName: 'jordeen',
              action: 'liked your post',
              time: '',
              avatarPath: 'assets/images/img_ellipse35.png',
            ),
            LikeItem(
              userName: 'tony5',
              action: 'liked your post',
              time: '',
              avatarPath: 'assets/images/img_ellipse35.png',
            ),
            LikeItem(
              userName: 'joee',
              action: 'liked your post',
              time: '',
              avatarPath: 'assets/images/img_ellipse35.png',
            ),
          ],
        ),
      ),
    );
  }
}

class LikeItem extends StatelessWidget {
  final String userName;
  final String action;
  final String time;
  final String avatarPath;

  const LikeItem({
    required this.userName,
    required this.action,
    required this.time,
    required this.avatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEDEDED), // #ededed color
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        children: [
          Icon(Icons.notifications, color: Colors.grey),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: userName,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
                      ),
                      TextSpan(
                        text: ' $action',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                if (time.isNotEmpty)
                  Text(time, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          SizedBox(width: 16),
          CircleAvatar(
            backgroundImage: AssetImage(avatarPath),
            radius: 24,
          ),
        ],
      ),
    );
  }
}

class MentionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "Today"),
            MentionItem(
              userName: 'Lisa',
              action: 'mentioned you in a comment',
              mention: '@divya',
              comment: '😊💖',
              time: '2 min',
              avatarPath: 'assets/images/img_ellipse35.png',
              isToday: true,
            ),
            MentionItem(
              userName: 'Merry',
              action: 'mentioned you in a comment',
              mention: '@divya',
              comment: 'great 🌻',
              time: '7 hr',
              avatarPath: 'assets/images/img_ellipse35.png',
              isToday: true,
            ),
            SectionTitle(title: "Last Week"),
            MentionItem(
              userName: 'chris',
              action: 'mentioned you in their story',
              mention: '',
              comment: '',
              time: '2 days',
              avatarPath: 'assets/images/img_ellipse35.png',
              isToday: false,
            ),
            MentionItem(
              userName: 'furry',
              action: 'mentioned you in a comment',
              mention: '@divya',
              comment: 'okay',
              time: '3 days',
              avatarPath: 'assets/images/img_ellipse35.png',
              isToday: false,
            ),
            MentionItem(
              userName: 'joee',
              action: 'mentioned you in their story',
              mention: '',
              comment: '',
              time: '7 days',
              avatarPath: 'assets/images/img_ellipse35.png',
              isToday: false,
            ),
          ],
        ),
      ),
    );
  }
}

class MentionItem extends StatelessWidget {
  final String userName;
  final String action;
  final String mention;
  final String comment;
  final String time;
  final String avatarPath;
  final bool isToday;

  const MentionItem({
    required this.userName,
    required this.action,
    required this.mention,
    required this.comment,
    required this.time,
    required this.avatarPath,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEDEDED), // #ededed color
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        children: [
          Icon(Icons.notifications, color: Colors.grey),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: userName,
                        style: TextStyle(
                          fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                          color: isToday ? Colors.black : Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      TextSpan(
                        text: ' $action',
                        style: TextStyle(
                          fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                          color: isToday ? Colors.black : Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      if (mention.isNotEmpty)
                        TextSpan(
                          text: ' $mention',
                          style: TextStyle(
                            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                            color: Color.fromRGBO(251, 109, 72, 1.000),
                            fontSize: 15,
                          ),
                        ),
                      if (comment.isNotEmpty)
                        TextSpan(
                          text: ' $comment',
                          style: TextStyle(
                            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                            color: isToday ? Colors.black : Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                    ],
                  ),
                ),
                if (time.isNotEmpty)
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 16),
          CircleAvatar(
            backgroundImage: AssetImage(avatarPath),
            radius: 24,
          ),
        ],
      ),
    );
  }
}