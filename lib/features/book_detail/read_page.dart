import 'package:flutter/material.dart';
import 'package:jidiu_reader/data/source_repository.dart';
import 'package:jidiu_reader/models/chapter.dart';
import 'package:jidiu_reader/models/chapter_content.dart';
import 'package:jidiu_reader/parsers/faloo_parser.dart';
class ReadPage extends StatefulWidget {
  List<Chapter> chapterList = [];
  int chapterIndex = 0;
  ReadPage({required this.chapterList, required this.chapterIndex, super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  ChapterContent? _chapterContent;
  Future<void> _getChapterContent() async {
    FalooParser parser = FalooParser();
    final contentHtml = await SourceRepository().fetchBookHtml(widget.chapterList[_chapterIndex].url);
    final contentList = parser.parseChapterContent(contentHtml);
    setState(() {
      _chapterContent = contentList;
    });
  }
  int _chapterIndex = 0;
  @override
  void initState() {
    super.initState();
    _chapterIndex = widget.chapterIndex;
    _getChapterContent();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chapterList[_chapterIndex].title),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Text(
            _chapterContent?.content.join('\n\n') ?? '',
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
                    _chapterContent = null;
                  });
                  _getChapterContent();
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
                    _chapterContent = null;
                  });
                  _getChapterContent();
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

