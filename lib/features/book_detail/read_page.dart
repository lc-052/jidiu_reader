import 'package:flutter/material.dart';
class ReadPage extends StatefulWidget {
  List<Map<String, dynamic>> chapterList = [];
  int chapterIndex = 0;
  ReadPage({required this.chapterList, required this.chapterIndex, super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  int _chapterIndex = 0;
  @override
  void initState() {
    super.initState();
    _chapterIndex = widget.chapterIndex;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.chapterList[_chapterIndex]['title']}'),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Text(
            widget.chapterList[_chapterIndex]['content'],
            style: const TextStyle(
              fontSize: 18,
              height: 1.8,
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
      child: SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (_chapterIndex > 0) {
                  setState(() {
                    _chapterIndex--;
                  });
                }
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.navigate_before),
                  Text('上一章'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_chapterIndex < widget.chapterList.length - 1) {
                  setState(() {
                    _chapterIndex++;
                  });
                }
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('下一章'),
                  Icon(Icons.navigate_next),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    ),
    );
  }
}

