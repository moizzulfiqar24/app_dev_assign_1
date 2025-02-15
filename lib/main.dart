import 'package:app_dev_assign_1/widgets/comment_tile.dart';
import 'package:app_dev_assign_1/widgets/custom_appbar.dart';
import 'package:app_dev_assign_1/widgets/event_tile.dart';
import 'package:app_dev_assign_1/widgets/stat_tile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom AppBar (Kept as per your original code)
          AppBar(
            shape: CustomAppBarShape(),
          ),

          // Profile Section (Kept as per your original code)
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

          // Selection Tab (Above MyEventTile)
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
          const SizedBox(height: 10),

          // Section Content (MyEventTile for all sections, replace as needed)
          Expanded(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.45,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      if (selectedIndex == 0)
                        MyEventTile() // Replace for Posts
                      else if (selectedIndex == 1)
                        MyCommentsTile() // Replace for Comments
                      else
                        MyStatsTile(), // Replace for Stats
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

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
