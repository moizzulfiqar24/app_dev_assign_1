// import 'package:app_dev_assign_1/widgets/comment_tile.dart';
// import 'package:app_dev_assign_1/widgets/custom_appbar.dart';
// import 'package:app_dev_assign_1/widgets/event_tile.dart';
// import 'package:app_dev_assign_1/widgets/stat_tile.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProfilePage(),
//     );
//   }
// }

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   int selectedIndex = 0; // 0 = Posts, 1 = Comments, 2 = Stats

//   // Event Data List (NEWLY ADDED)
//   final List<Map<String, String>> events = [
//     {
//       'eventName': 'Tech Conference',
//       'eventDate': '30 November 2024, 9:00 AM',
//       'eventAddress': '13th Street, Park Avenue',
//       'eventPerson': 'John Doe',
//       'imagePath': 'assets/images/conf.jpg',
//     },
//     {
//       'eventName': 'Music Festival',
//       'eventDate': '15 December 2024, 6:00 PM',
//       'eventAddress': 'Sunset Arena, LA',
//       'eventPerson': 'DJ Alex',
//       'imagePath': 'assets/images/conf.jpg',
//     },
//     {
//       'eventName': 'Business Meetup',
//       'eventDate': '20 January 2025, 3:00 PM',
//       'eventAddress': 'Downtown Business Hub',
//       'eventPerson': 'Sarah Lee',
//       'imagePath': 'assets/images/conf.jpg',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Custom AppBar (No changes)
//           AppBar(
//             shape: CustomAppBarShape(),
//           ),

//           // Profile Section (No changes)
//           Container(
//             height: 52 * 2.0 * 0.85,
//           ),
//           CircleAvatar(
//             radius: 60,
//             backgroundColor: Colors.black,
//             child: ClipOval(
//               child: Image.asset(
//                 'assets/images/avatar.png',
//                 width: 110,
//                 height: 110,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             "John Doe",
//             style: TextStyle(
//               color: Color(0xFFD62828),
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 6),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: Text(
//               'John Doe exists. John Doe builds. John Doe innovates. What’s next? Only time will tell...',
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 fontSize: 15,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           const SizedBox(height: 30),

//           // Selection Tab (No changes)
//           Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildTabButton("Posts", 0),
//                   _buildTabButton("Comments", 1),
//                   _buildTabButton("Stats", 2),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 height: 1,
//                 width: 400,
//                 color: Colors.black,
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),

//           // Section Content (MyEventTile now dynamically displays events)
//           Expanded(
//             child: SizedBox(
//               height: MediaQuery.sizeOf(context).height * 0.45,
//               child: ListView.builder(
//                 itemCount: events.length,
//                 itemBuilder: (context, index) {
//                   final event = events[index]; // Fetch event data
//                   return Column(
//                     children: [
//                       if (selectedIndex == 0)
//                         MyEventTile(
//                           eventName: event['eventName']!,
//                           eventDate: event['eventDate']!,
//                           eventAddress: event['eventAddress']!,
//                           eventPerson: event['eventPerson']!,
//                           imagePath: event['imagePath']!,
//                         )
//                       else if (selectedIndex == 1)
//                         MyCommentsTile() // No changes
//                       else
//                         MyStatsTile(), // No changes
//                       const SizedBox(height: 20),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Tab Button Builder (No changes)
//   Widget _buildTabButton(String title, int index) {
//     bool isSelected = selectedIndex == index;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: Text(
//         title,
//         style: TextStyle(
//           color: isSelected ? Colors.red : Colors.black54,
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

import 'package:app_dev_assign_1/widgets/comment_tile.dart';
import 'package:app_dev_assign_1/widgets/custom_appbar.dart';
import 'package:app_dev_assign_1/widgets/event_tile.dart';
import 'package:app_dev_assign_1/widgets/stat_tile.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto', // Set Roboto as the default font
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
  int selectedIndex = 0; // 0 = Posts, 1 = Comments, 2 = Stats

  // Event Data List
  final List<Map<String, String>> events = [
    {
      'eventName': 'Tech Conference',
      'eventDate': '30 November 2024, 9:00 AM',
      'eventAddress': '13th Street, Park Avenue',
      'eventPerson': 'John Doe',
      'imagePath': 'assets/images/conf.jpg',
    },
    {
      'eventName': 'Music Festival',
      'eventDate': '15 December 2024, 6:00 PM',
      'eventAddress': 'Sunset Arena, LA',
      'eventPerson': 'DJ Alex',
      'imagePath': 'assets/images/conf.jpg',
    },
    {
      'eventName': 'Business Meetup',
      'eventDate': '20 January 2025, 3:00 PM',
      'eventAddress': 'Downtown Business Hub',
      'eventPerson': 'Sarah Lee',
      'imagePath': 'assets/images/conf.jpg',
    },
  ];

  // Comments Data List
  final List<Map<String, String>> comments = [
    {
      'eventName': 'Flutter Flash',
      'comment': 'Looks like an amazing event!',
      'eventDate': '30 November 2024, 11:00 PM',
    },
    {
      'eventName': 'Dart Dev Summit',
      'comment': 'Can’t wait to attend!',
      'eventDate': '12 December 2024, 5:30 PM',
    },
    {
      'eventName': 'AI Innovations',
      'comment': 'Great insights shared!',
      'eventDate': '22 January 2025, 2:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom AppBar
          AppBar(
            shape: CustomAppBarShape(),
          ),

          // Profile Section
          Container(
            height: 52 * 2.0 * 0.85,
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

          // Section Content
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

  // Tab Button Builder
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
