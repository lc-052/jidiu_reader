import 'package:flutter/material.dart';
import 'package:jidiu_reader/app/app_colors.dart';
import 'package:jidiu_reader/features/book_detail/book_detail_page.dart';
import 'package:jidiu_reader/models/book.dart';
import 'package:jidiu_reader/parsers/faloo_parser.dart';
import 'package:jidiu_reader/data/source_repository.dart';
class FalooFree extends StatefulWidget {
  const FalooFree({super.key});

  @override
  State<FalooFree> createState() => _FalooFreeState();
}

class _FalooFreeState extends State<FalooFree> {
  List<Book> _books = [];
  Future<void>   _fetchBooks() async {
    final html = await SourceRepository().fetchBookHtml(
      'https://wap.faloo.com/y_0_0_0_0_6_0.html',
    );

    final books = FalooParser().parseFreeBooks(html);

    if (!mounted) return;

    setState(() {
      _books = books;
    });
  }

  //初始化的时候获取图书列表
  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('飞卢免费'),
      ),
      body: Container(
        width: double.infinity,

        child: ListView(
            children: List.generate(_books.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => BookDetailPage(bookData: _books[index])));
                },
                child: Container(
                  height: 170,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Image.network(_books[index].img ?? ''),
                        margin: const EdgeInsets.all(8.0),
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Expanded(child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_books[index].title, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),),
                                Text(_books[index].author  , style: TextStyle(fontSize: 14.0,),),
                              ],
                            ),

                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text('阅读到xx', style: TextStyle(fontSize: 14.0, ),),
                            //     Container(
                            //       decoration: BoxDecoration(
                            //         color: AppColors.primary,
                            //         borderRadius: BorderRadius.circular(2.5),
                            //       ),
                            //       height: 5,
                            //       width: 100,
                            //     )
                            //   ],
                            //
                            // ),
                            // Text('上一次阅读:zz', style: TextStyle(fontSize: 14.0, ),),
                          ],

                        ),
                      ))

                    ],
                  ),
                ),
              );
            })


        ),
      ),
    );
  }
}
