import 'package:flutter/material.dart';
import 'package:jidiu_reader/app/app_colors.dart';
import 'package:jidiu_reader/features/book_detail/book_detail_page.dart';
class BookshelfPage extends StatefulWidget {
  const BookshelfPage({super.key});

  @override
  State<BookshelfPage> createState() => _BookshelfPageState();
}

class _BookshelfPageState extends State<BookshelfPage> {
  List<Map<String, dynamic>> books = [
    {
      'title': '寄丢之道',
      'author': '不寄丢',
      'cover':'lib/assets/bookimages/The_way_of_jidiu.png',
      'chapter': '第213章',
      'lastread':'2022-7-1',
      'description': '这是一本关于寄丢的书'

    },
    {
      'title': '寄丢铁道列车',
      'author': '不寄丢',
      'cover':'lib/assets/bookimages/The_Jidiu_Railway_Express.png',
      'chapter': '第47章',
      'lastread':'2024-7-1',
      'description': '这是一本关于寄丢的书'
    },
    {
      'title': '了不起的不寄丢',
      'author': '不寄丢',
      'cover':'lib/assets/bookimages/The_Great_Un-jidiu.png',
      'chapter': '第382章' ,
      'lastread':'2021-7-1',
      'description': '这是一本关于寄丢的书'
    },{
      'title': '寄丢是怎样炼成的',
      'author': '不寄丢',
      'cover':'lib/assets/bookimages/How_jidiu_Was_Tempered.png',
      'chapter': '第39章',
      'lastread':'2025-7-1',
      'description': '这是一本关于寄丢的书'
    },
    {
      'title': '丢乐园',
      'author': '不寄丢',
      'cover':'lib/assets/bookimages/Diu_Paradise.png',
      'chapter': '第67章',
      'lastread':'2020-7-1',
      'description': '这是一本关于寄丢的书'
    },
    {
      'title': '吸之寄丢',
      'author': '不寄丢',
      'cover':'lib/assets/bookimages/jidiu_of_the_Breath.png',
      'chapter': '第32章',
      'lastread':'2022-7-1',
      'description': '这是一本关于寄丢的书'
    },
    {
      'title': '寄丢传',
      'author': '不寄丢',
      'cover':'lib/assets/bookimages/The_Biography_of_jidiu.png',
      'chapter': '第90章',
      'lastread':'2029-7-1',
      'description': '这是一本关于寄丢的书'
    },
  ];
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,

      child: ListView(
          children: List.generate(books.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => BookDetailPage(bookData: books, index: index,)));
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
                      child: Image.asset(books[index]['cover']),
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
                              Text(books[index]['title'], style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                              Text(books[index]['author'], style: TextStyle(fontSize: 14.0, ),),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('阅读到${books[index]['chapter']}', style: TextStyle(fontSize: 14.0, ),),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(2.5),
                                ),
                                height: 5,
                                width: 100,
                              )
                            ],

                          ),
                          Text('上一次阅读: ${books[index]['lastread']}', style: TextStyle(fontSize: 14.0, ),),
                        ],

                      ),
                    ))

                  ],
                ),
              ),
            );
          })


      ),
    );
  }
}
