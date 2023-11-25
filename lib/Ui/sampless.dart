import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Samples extends StatefulWidget {
  const Samples({Key? key}) : super(key: key);

  @override
  State<Samples> createState() => _SamplesState();
}

List<String> items = [
  "Home",
  "Explore",
  "Search",
  "Feed",
  "Posts",
  "Activity",
  "Setting",
  "Profile",
];

List<IconData> icons = [
  Icons.home,
  Icons.explore,
  Icons.search,
  Icons.feed,
  Icons.post_add,
  Icons.local_activity,
  Icons.settings,
  Icons.person,
];

class _SamplesState extends State<Samples> {
  int current = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        current = pageController.page!.round();
      });
    });
  }

  void scrollToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Column(
          children: [
            Text(
              "Custom TabBar in Flutter",
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "@CodeWithFlexZ",
              style: GoogleFonts.ubuntu(
                fontSize: 15,
                color: Colors.white60,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 80,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
               controller: pageController,
              itemBuilder: (ctx, idx) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      current = idx;
                    });
                    scrollToPage(idx);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.all(5),
                    width: 100,
                    height: 55,
                    decoration: BoxDecoration(
                      color:
                      current == idx ? Colors.white70 : Colors.white54,
                      borderRadius: current == idx
                          ? BorderRadius.circular(12)
                          : BorderRadius.circular(7),
                      border: current == idx
                          ? Border.all(
                        color: Colors.deepPurpleAccent,
                        width: 2.5,
                      )
                          : null,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icons[idx],
                            size: current == idx ? 23 : 20,
                            color: current == idx
                                ? Colors.black
                                : Colors.grey.shade400,
                          ),
                          Text(
                            items[idx],
                            style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w500,
                              color: current == idx
                                  ? Colors.black
                                  : Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: items.length,
              controller: pageController,
              onPageChanged: (int index) {
                setState(() {
                  current = index;
                });
                scrollToPage(index);
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        size: 200,
                        color: Colors.deepPurpleAccent,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${items[index]} Tab Content",
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
