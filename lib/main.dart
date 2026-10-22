import 'package:flutter/material.dart';
import 'package:jidiu_reader/app/app_theme.dart';
import 'package:jidiu_reader/app/theme_controller.dart';
import 'package:jidiu_reader/features/bookshelf/bookshelf_page.dart';
import 'package:jidiu_reader/features/discover/book_source_detail/faloo_free.dart';
import 'package:jidiu_reader/features/discover/discover_page.dart';
import 'package:jidiu_reader/features/profile/profile_page.dart';
import 'package:jidiu_reader/features/settings/setting_page.dart';
void main() =>runApp(MainApp());
class MainApp extends StatefulWidget {

  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  final ThemeController _themeController = ThemeController();
  final List<Map<String, dynamic>> items = [
    {'label': '书架','icon': 'lib/assets/bookshelf-normal.png','activeIcon': 'lib/assets/bookshelf-active.png'},
    {'label': '发现', 'icon': 'lib/assets/discover-normal.png', 'activeIcon': 'lib/assets/discover-active.png'},
    {'label': '我的', 'icon': 'lib/assets/profile-normal.png', 'activeIcon': 'lib/assets/profile-active.png' },
  ];
  void dispose() {
    _themeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return ListenableBuilder(listenable: _themeController, builder: (context,child){
      return MaterialApp(

        routes: {
          '/settings': (context) => SettingPage(controller: _themeController),
          '/faloo': (context) => FalooFree(),
        },
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _themeController.themeMode,

        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('寄丢阅读'),
            actions: [
              GetSetting(),
            ],

          ),
          body: IndexedStack(index: _selectedIndex,
            children: [
              BookshelfPage(),
              DiscoverPage(),
              ProfilePage(),
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
                          Text(items[index]['label'])
                        ],
                      )
                  ),
                  );
                })
            ),

          ),
        ),


      );
    });
  }
}
class GetSetting extends StatelessWidget {
  const GetSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings_outlined),
      onPressed: () {
        Navigator.pushNamed(context, '/settings');
      },
    );
  }
}




