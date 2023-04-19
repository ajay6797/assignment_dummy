import 'package:flutter/material.dart';
import 'container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Messages Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation Bar and Drawer',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Charities')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MyContainer(
                  color: Color.fromARGB(255, 222, 187, 51),
                  title: 'Doctors without borders',
                  description: 'Goals   |   Raised',
                  value: 0.5,
                  imageUrl: 'https://picsum.photos/id/100/200/300',
                ),
                const SizedBox(height: 16),
                const MyContainer(
                  color: Color.fromRGBO(159, 77, 225, 1),
                  title: 'American Red Cross',
                  description: 'Goals   |   Raised',
                  value: 0.6,
                  imageUrl: 'https://picsum.photos/id/200/200/300',
                ),
                const SizedBox(height: 16),
                const MyContainer(
                  color: Color.fromRGBO(59, 255, 59, 1),
                  title: 'The Nature Conservance',
                  description: 'Goals   |   Raised',
                  value: 0.9,
                  imageUrl: 'https://picsum.photos/id/300/200/300',
                ),
                const SizedBox(height: 16),
                const MyContainer(
                  color: Color.fromRGBO(252, 19, 3, 1),
                  title: 'Natural REsources Defense...',
                  description: 'Goals   |   Raised',
                  value: 0.2,
                  imageUrl: 'https://picsum.photos/id/400/200/300',
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                child: Text('Select items'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
