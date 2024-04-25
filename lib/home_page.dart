import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLc = 'Select LC';
  List<String> _lcList = ['Select LC', 'LC-1', 'LC-2', 'LC-3', 'LC-4', 'LC-5'];
  int _currentIndex = 0;

  late final List<Widget> _pages;

  _HomePageState() {
    _pages = [
      Page1(_selectedLc, _lcList),
      Page2(),
      Page3(),
      Page4(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _currentIndex == 0
            ? DropdownButton(
          value: _selectedLc,
          items: _lcList.map((lc) {
            return DropdownMenuItem(
              value: lc,
              child: Text(lc),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedLc = value as String;
            });
          },
        )
            : Text('Page ${_currentIndex + 1}'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green, // color of the selected item
        unselectedItemColor: Colors.grey, // color of the unselected item
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Page 1'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Page 2'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Page 3'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Page 4'),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final String _selectedLc;
  final List<String> _lcList;

  Page1(this._selectedLc, this._lcList);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.contact_mail), text: 'Contact'),
            Tab(icon: Icon(Icons.info), text: 'About',),
            Tab(icon: Icon(Icons.event), text: 'Events'),
            Tab(icon: Icon(Icons.hotel), text: 'Host'),
          ],
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Contact Page')),
            Center(child: Text('About')),
            Center(child: Text('Events Page')),
            Center(child: Text('Host Page')),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Page 2'));
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Page 3'));
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Page 4'));
  }
}