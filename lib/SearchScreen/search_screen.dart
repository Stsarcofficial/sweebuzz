import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int currentIndex = 0;

  void onPageChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(
              currentIndex: currentIndex,
              onPageChange: onPageChange,
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Wrap(
                children: [
                  CategoryChip(label: 'Technology'),
                  CategoryChip(label: 'Fashion'),
                  CategoryChip(label: 'Nature'),
                  CategoryChip(label: 'Travel'),
                  CategoryChip(label: 'Animals'),
                  CategoryChip(label: 'Startup'),
                  CategoryChip(label: 'Politics'),
                  CategoryChip(label: 'Fitness'),
                  CategoryChip(label: 'Education'),
                  CategoryChip(label: 'Finance'),
                  CategoryChip(label: 'Entertainment'),
                ],
              ),
            ),
            Expanded(
                child: SelectedPage(
              currentindex: currentIndex,
            )),
          ],
        ));
  }
}

class SelectedPage extends StatelessWidget {
  final int currentindex;
  const SelectedPage({required this.currentindex, super.key});

  @override
  Widget build(BuildContext context) {
    switch (currentindex) {
      case 0:
        return BlogsView(index: currentindex);
      case 1:
        return VlogView(index: currentindex);
      case 2:
        return PostsView(
          index: currentindex,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class TopBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onPageChange;

  const TopBar({
    required this.currentIndex,
    required this.onPageChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 239, 239, 239)),
      child: SafeArea(
        child: Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  minimumSize: const Size(0, 0),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: currentIndex == 0
                      ? const Color.fromARGB(255, 79, 79, 79)
                      : Colors.transparent,
                  foregroundColor: currentIndex == 0
                      ? Colors.white
                      : const Color.fromARGB(255, 79, 79, 79)),
              onPressed: () => onPageChange(0),
              child: const Text(
                'Blogs',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'outfit',
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 2),
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
              onPressed: () => onPageChange(1),
              child: const Text('Vlogs',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'outfit',
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(width: 2),
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
              onPressed: () => onPageChange(2),
              child: const Text(
                'Posts',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'outfit',
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Spacer(),
            const Expanded(
              flex: 5,
              child: TextField(
                cursorHeight: 23,
                style: TextStyle(
                  fontSize: 17,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontFamily: "outfit", fontSize: 17),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogsView extends StatelessWidget {
  final int index;
  const BlogsView({required this.index, super.key});

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
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "Trending",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "outfit",
                fontWeight: FontWeight.w400),
          ),
        ),
        Expanded(
          child: GridView.count(
            childAspectRatio: 1.3,
            crossAxisCount: 2,
            children: List.generate(imageData.length, (index) {
              return Container(
                padding:
                    const EdgeInsets.only(left: 5, right: 2, bottom: 5),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    DecoratedBox(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken),
                      image: AssetImage(
                        imageData[index]['url']!,
                      ),
                    ))),
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
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "4.5 k",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "outfit",
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
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
              );
            }),
          ),
        ),
      ],
    );
  }
}

class PostsView extends StatelessWidget {
  final int index;
  const PostsView({required this.index, super.key});

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
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "Trending",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "outfit",
                fontWeight: FontWeight.w400),
          ),
        ),
        Expanded(
          child: GridView.count(
            childAspectRatio: 1,
            crossAxisCount: 3,
            children: List.generate(imageData.length, (index) {
              return Container(
                  padding: const EdgeInsets.only(
                      left: 5, right: 2, top: 0, bottom: 5),
                  child: Stack(fit: StackFit.expand, children: <Widget>[
                    DecoratedBox(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken),
                      image: AssetImage(
                        imageData[index]['url']!,
                      ),
                    ))),
                  ]));
            }),
          ),
        ),
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: Color.fromARGB(255, 239, 239, 239),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0),
        labelStyle: const TextStyle(
            fontFamily: "outfit",
            fontSize: 10,
            color: Color.fromARGB(255, 91, 91, 91)),
        label: Text(label),
        backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      ),
    );
  }
}

class VlogView extends StatelessWidget {
  final int index;

  const VlogView({required this.index, super.key});

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
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
      {'url': 'assets/images/img_rectangle180.png', 'text': 'Image 6'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "Trending",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "outfit",
                fontWeight: FontWeight.w400),
          ),
        ),
        Expanded(
          child: GridView.count(
            childAspectRatio: 1.3,
            crossAxisCount: 2,
            children: List.generate(imageData.length, (index) {
              return Container(
                padding: const EdgeInsets.only(left: 3, right: 2, bottom: 5),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    DecoratedBox(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken),
                      image: AssetImage(
                        imageData[index]['url']!,
                      ),
                    ))),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      right: 2,
                      child: Row(
                        children: [
                          Icon(Icons.play_circle, color: Colors.white),
                          SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                softWrap: true,
                                imageData[index]['text']!,
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
              );
            }),
          ),
        ),
      ],
    );
  }
}
