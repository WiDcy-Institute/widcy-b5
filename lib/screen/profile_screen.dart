
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'NotoSansKhmer'),),
        backgroundColor: Colors.blueAccent,
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.more_vert, color: Colors.white),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            left:0,
            top:40,
            right: 0,
            child:  CircleAvatar(
              radius: 64,
              backgroundImage: AssetImage("assets/profile/profile.png"),
            ),
          ),
          Opacity(
              opacity: 0.5, //from 0-1, 0.5 = 50% opacity
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/profile/banner.jpg'),
                    colorFilter: new ColorFilter.mode(Colors.white, BlendMode.dstOver),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Software Engineer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
