import 'package:flutter/material.dart';
import 'package:radio_app/screens/radio_page/radio_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _page = [RadioPage(), new Text("page 2")];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _page[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 124, 115, 115),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            _bottomNavIt(Icons.play_arrow, 'Listen'),
            _bottomNavIt(Icons.favorite, 'Favourite'),
          ],
          onTap: onTapTrapped,
        ),
      ),
    );
  }

  _bottomNavIt(IconData icon, String title) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.grey,
      icon: new Icon(
        icon,
        color: Color.fromARGB(255, 255, 7, 7),
      ),
      activeIcon: new Icon(
        icon,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      label: title,
    );
  }

  void onTapTrapped(int index) {
    if (!mounted) return;
    setState(() {
      _currentIndex = index;
    });
  }
}
