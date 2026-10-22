import 'package:flutter/physics.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart'as html_parser;
import 'package:fast_gbk/fast_gbk.dart';
import 'package:html/dom.dart' show Element;
import 'package:jidiu_reader/parsers/faloo_parser.dart';
import 'package:dio/dio.dart';
import 'package:fast_gbk/fast_gbk.dart';
class SourceRepository {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
  Future<String> fetchBookHtml(String url) async {
    final response = await _dio.get<List<int>>(
      url,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );

    return gbk.decode(response.data!);
  }
}

// Future<void> main() async{
//   // final repository = SourceRepository();
//   // final html = await repository.fetchBookHtml('https://wap.faloo.com/1418805.html');
//   // final parser = FalooParser();
//   // final book = parser.parseBookInfo(html);
//   // final chapterHtml = await repository.fetchBookHtml('https://wap.faloo.com/booklist_${book.id}.html');
//   // final chapterList = parser.parseChapterInfo(chapterHtml);
//   //
//   //
//   // final contentHtml = await repository.fetchBookHtml(chapterList[1].url);
//   // final contentList = parser.parseChapterContent(contentHtml);
//   // print(contentList.content);
//   final html = await SourceRepository().fetchBookHtml(
//     'https://wap.faloo.com/y_0_0_0_0_6_0.html',
//   );
//
//   final books = FalooParser().parseFreeBooks(html);
//
//   for (final book in books) {
//     print('书名：${book.title}');
//     print('图片地址：${book.img ?? "没有获取到图片地址"}');
//   }
//
//
// }



