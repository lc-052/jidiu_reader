import 'package:flutter/material.dart';
import 'package:jidiu_reader/app/app_colors.dart';
import 'package:jidiu_reader/app/theme_controller.dart';

class ThemeWidget extends StatefulWidget {
  final ThemeController themeController;
  const ThemeWidget({required this.themeController, super.key});

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  List<Color> colors = [
    Colors.white,
    AppColors.mint,
    AppColors.primary,
  ];
  List<Color> Textcolors = [
    Colors.black,
    AppColors.primary,
    AppColors.mint,
  ];
  List<Map<String, ThemeMode>> themes = [
    { "跟随系统": ThemeMode.system},
    { "浅色模式": ThemeMode.light},
    { "深色模式": ThemeMode.dark},
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Text("请选择主题样式", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          Row(
              children: List.generate(themes.length, (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        widget.themeController.ChangeThemeMode(themes[index].values.first);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors[index],
                        border: Border.all(
                          color: _selectedIndex == index ? Textcolors[index] : Colors.transparent,
                          width: 2,
                        ),

                      ),
                      alignment: Alignment.center,
                      child: Text(themes[index].keys.first, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Textcolors[index]),),
                    ),
                  )
                );
              })
          ),
        ],
      )
    );
  }
}
