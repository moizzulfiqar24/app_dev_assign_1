import 'package:app_dev_assign_1/widgets/comment_tile.dart';
import 'package:app_dev_assign_1/widgets/custom_appbar.dart';
import 'package:app_dev_assign_1/widgets/event_tile.dart';
import 'package:app_dev_assign_1/widgets/stat_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   fontFamily: 'Roboto',
      // ),
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;

  // Events
  final List<Map<String, String>> events = [
    {
      'eventName': 'Tech Conference',
      'eventDate': '10 Feb 2024, 9:00 PM',
      'eventAddress': 'Clifton, Karachi',
      'eventPerson': 'John Doe',
      'imagePath': 'assets/images/conf.jpg',
    },
    {
      'eventName': 'Tech Meetup',
      'eventDate': '10 Feb 2024, 9:00 PM',
      'eventAddress': 'DHA, Lahore',
      'eventPerson': 'Moiz',
      'imagePath': 'assets/images/conf.jpg',
    },
    {
      'eventName': 'Tech Competition',
      'eventDate': '10 Feb 2024, 9:00 PM',
      'eventAddress': 'Gulshan, Karachi',
      'eventPerson': 'Zulfiqar',
      'imagePath': 'assets/images/conf.jpg',
    },
  ];

  // Comments
  final List<Map<String, String>> comments = [
    {
      'eventName': 'Flutter Flash',
      'comment': 'Looks like an amazing event!',
      'eventDate': '10 Feb 2024, 9:00 PM',
    },
    {
      'eventName': 'Tech Summit',
      'comment': 'Amazing event!',
      'eventDate': '10 Feb 2024, 9:00 PM',
    },
    {
      'eventName': 'Tech Competition',
      'comment': 'Great event!',
      'eventDate': '10 Feb 2024, 9:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            shape: CustomAppBarShape(),
          ),

          // Profile Section
          Container(
            height: 52 * 2.0 * 0.75,
          ),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.black,
            child: ClipOval(
              child: Image.asset(
                'assets/images/avatar.png',
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "John Doe",
            style: TextStyle(
              color: Color(0xFFD62828),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'John Doe exists. John Doe builds. John Doe innovates. What’s next? Only time will tell...',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),

          // Selection Tab
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTabButton("Posts", 0),
                  _buildTabButton("Comments", 1),
                  _buildTabButton("Stats", 2),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 1,
                width: 400,
                color: Colors.black,
              ),
            ],
          ),
          // const SizedBox(height: 10),

          // Main Content
          Expanded(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.45,
              child: ListView.builder(
                itemCount: selectedIndex == 2
                    ? 1
                    : (selectedIndex == 1 ? comments.length : events.length),
                itemBuilder: (context, index) {
                  if (selectedIndex == 0) {
                    final event = events[index];
                    return Column(
                      children: [
                        MyEventTile(
                          eventName: event['eventName']!,
                          eventDate: event['eventDate']!,
                          eventAddress: event['eventAddress']!,
                          eventPerson: event['eventPerson']!,
                          imagePath: event['imagePath']!,
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  } else if (selectedIndex == 1) {
                    final comment = comments[index];
                    return Column(
                      children: [
                        MyCommentsTile(
                          eventName: comment['eventName']!,
                          comment: comment['comment']!,
                          eventDate: comment['eventDate']!,
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        const MyStatsTile(),
                        const SizedBox(height: 20),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Tab Button
  Widget _buildTabButton(String title, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.red : Colors.black54,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
