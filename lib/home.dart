import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex= 0;
  PageController pageController = PageController();
  void onTapped (int index){
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      Text('Syrpronet'),
      ),
      body: PageView(
        controller:pageController,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.yellow),
          Container(color: Colors.green),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem (icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem (icon: Icon(Icons.search), label:'Search'),
          BottomNavigationBarItem (icon: Icon(Icons.add), label:'Add'),
          BottomNavigationBarItem (icon: Icon(Icons.notifications), label:'Notifs'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}
