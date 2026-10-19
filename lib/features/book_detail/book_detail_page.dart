import 'package:flutter/material.dart';
import 'package:jidiu_reader/app/app_colors.dart';
import 'package:jidiu_reader/app/app_theme.dart';
import 'package:jidiu_reader/features/book_detail/read_page.dart';
class BookDetailPage extends StatefulWidget {
  List<Map<String, dynamic>> bookData = [];
  int index = 0;
  BookDetailPage({required this.bookData, required this.index, super.key}) ;

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  List<Map<String, dynamic>> chapters = [
    {
      'title': '第一章 初入寄丢世界',
      'content': '这是第一章的正文。主角站在山崖边，望着远处的群山，开始了自己的旅程……',
    },
    {
      'title': '第二章 奇妙的旅程',
      'content': '第二天清晨，主角收拾好行囊，踏上了新的旅途……',
    },
    {
      'title': '第三章 遇见伙伴',
      'content': '走过一片森林后，主角遇见了一位神秘的伙伴……',
    },
  ];
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
                      child: Image.asset(
                        widget.bookData[widget.index]['cover'],
                        width: 160,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(widget.bookData[widget.index]['title'], style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    Text("作者：${widget.bookData[widget.index]['author']}", style: TextStyle(fontSize: 16),),
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
                  Text(widget.bookData[widget.index]['description'], style: TextStyle(fontSize: 14),),
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
                  Text('共100章', style: TextStyle(fontSize: 16),),
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
                    title: Text(chapters[index]['title']),
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
