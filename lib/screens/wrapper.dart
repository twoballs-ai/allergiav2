import 'package:allergia/screens/cabinet.dart';
import 'package:allergia/screens/home_screen.dart';

import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  Wrapper();

  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomeScreen(), PersonalCabinet()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: ('Главная'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: ('Профиль'),
          ),
        ],
        selectedItemColor: Colors.teal,
        elevation: 5.0,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}
