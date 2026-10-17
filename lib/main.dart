import 'package:flutter/material.dart';
void main() =>runApp(MainApp());
class MainApp extends StatefulWidget {

  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> items = [
    {'label': '书架','icon': 'lib/assets/bookshelf-normal.png','activeIcon': 'lib/assets/bookshelf-active.png'},
    {'label': '发现', 'icon': 'lib/assets/discover-normal.png', 'activeIcon': 'lib/assets/discover-active.png'},
    {'label': '我的', 'icon': 'lib/assets/profile-normal.png', 'activeIcon': 'lib/assets/profile-active.png' },
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(index: _selectedIndex,
          children: [
            Text('Bookshelf'),
            Text('Discover'),
            Text('Profile'),
          ],
        ),
        bottomNavigationBar: Container(

          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 80,
          width: double.infinity,
          child:
          Row(
              children: List.generate(items.length, (index) {
                return Expanded(child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Column(
                      children: [
                        _selectedIndex == index ?  Image.asset(items[index]['activeIcon'], width: 30, height: 30,) : Image.asset(items[index]['icon'], width: 24, height: 24,),
                        Text(items[index]['label'],style: TextStyle(color: Colors.black),)
                      ],
                    )
                ),
                );
              })
          ),

        ),
      ),
      
    );
  }
}


