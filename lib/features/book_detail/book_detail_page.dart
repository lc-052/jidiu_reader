import 'package:flutter/material.dart';
import 'package:jidiu_reader/app/app_colors.dart';
import 'package:jidiu_reader/app/app_theme.dart';
import 'package:jidiu_reader/data/source_repository.dart';
import 'package:jidiu_reader/features/book_detail/read_page.dart';
import 'package:jidiu_reader/models/book.dart';
import 'package:jidiu_reader/models/chapter.dart';
import 'package:jidiu_reader/parsers/faloo_parser.dart';
class BookDetailPage extends StatefulWidget {
  Book bookData ;

  BookDetailPage({required this.bookData, super.key}) ;

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  List<Chapter> chapters = [];
  Future<void> getChapterList() async {
    final parser = FalooParser();
    final chapterHtml = await SourceRepository().fetchBookHtml('https://wap.faloo.com/booklist_${widget.bookData.id}.html');
    final chapterList = parser.parseChapterInfo(chapterHtml);
    setState(() {
      chapters = chapterList;
    });
  }
  @override
  void initState() {
    getChapterList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('书籍详情', ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: SizedBox(
                width: 300,
                height: 320,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.bookData.img??'',
                        width: 160,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(widget.bookData.title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text("作者：${widget.bookData.author}", style: TextStyle(fontSize: 16),),
                  ],
                ),
              ),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('作品简介', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Text(widget.bookData.id, style: TextStyle(fontSize: 14),),
                ],
              ),
            )

          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () {
              },
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primary,
                  ),
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  child: Text('开始阅读', style: TextStyle(fontSize: 16, color: Colors.white),),
                ),
              ),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('章节目录', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  Text('共${chapters.length}章', style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReadPage(chapterList: chapters, chapterIndex: index)));
                  },
                  child: ListTile(
                    title: Text(chapters[index].title),
                  ),
                );
              },
              childCount: chapters.length,
            ),
          ),

        ],
      )
    );
  }
}
