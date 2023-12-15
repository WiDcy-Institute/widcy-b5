
import 'package:flutter/material.dart';
import 'package:widcy/screen/academic_screen.dart';
import 'package:widcy/screen/course_screen.dart';
import 'package:widcy/screen/home_screen.dart';
import 'package:widcy/screen/news_screen.dart';
import 'package:widcy/screen/profile_screen.dart';

class MainScreen extends StatefulWidget {

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    AcademicScreen(),
    NewsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.tealAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor:Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Academic',
            backgroundColor:Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'News',
            backgroundColor:Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Profile',
            backgroundColor:Colors.blueAccent,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
