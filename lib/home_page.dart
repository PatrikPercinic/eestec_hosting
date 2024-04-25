import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLc = 'Select LC';
  List<String> _lcList = ['Select LC', 'LC Zagreb', 'LC Ankara', 'LC Skopje'];
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
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.info), text: 'About',),
            Tab(icon: Icon(Icons.event), text: 'Events'),
          ],
        ),
        body: TabBarView(
          children: [
            ContactPage(),
            Center(child: Text('Events Page')),

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
class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'LC Zagreb',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        'EESTEC LC Zagreb is a local committee of EESTEC, located in the heart of Zagreb, Croatia. Our committee is dedicated to providing a unique experience for students of electrical engineering and computer science at the University of Zagreb.\n\n'
                            'We are a group of enthusiastic and motivated students who share a passion for technology and innovation. Our goal is to create a community where students can come together, share ideas, and learn from each other. We organize various events, such as workshops, seminars, and competitions, which are designed to help our members develop their skills and stay up-to-date with the latest trends and technologies in the field.\n\n'
                            'In addition to our technical activities, we also place a strong emphasis on socializing and having fun. We believe that building relationships and networking with fellow students and professionals is an essential part of a student\'s development, and we strive to create an environment that is welcoming, inclusive, and supportive.\n\n'
                            'Our committee is known for its warm and friendly atmosphere, and we are proud to have a diverse group of members from different backgrounds and cultures. We are committed to providing a platform for our members to grow, both personally and professionally, and to make a positive impact on the community.\n\n'
                            'If you are a student of electrical engineering or computer science at the University of Zagreb, or if you are simply interested in learning more about our organization, we invite you to join us and become a part of the EESTEC LC Zagreb community.',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage('https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250'), // Replace with leader's photo
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Leader: John Doe',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      // Add your message functionality here
                    },
                    child: Text('Message'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ApplicationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Apply for Hosting'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'If you want to be a host, fill out the form below:',
                  style: TextStyle(fontSize: 16.0),
                ),
                // Form fields for application
                SizedBox(height: 20.0),
                Text(
                  'Further Questions:',
                  style: TextStyle(fontSize: 20.0),
                ),
                // Additional questions form fields
              ],
            ),
        ),
        );
  }
}

class ContactPagea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to EESTEC Hosting!',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
              },
              child: Text('Contact'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ApplicationForm()),
                );
              },
              child: Text('Apply for Hosting'),
            ),
          ],
        ),
      ),
    );
  }
}

