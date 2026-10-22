import 'package:flutter/material.dart';
import 'package:jidiu_reader/app/app_colors.dart';
class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Text('书源选择'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/faloo');
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text('飞卢免费', style: TextStyle(color: Colors.white),),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primary),
                  ),
                ),
              )),
              Expanded(child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(20),
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primary),
                ),
              ),),
              Expanded(child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(20),
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primary),
                ),
              ),)

            ],
          )
        ],
      )
    );
  }
}
