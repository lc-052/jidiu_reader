import 'package:html/parser.dart' as html_parser;
import '../models/book.dart';
import '../models/chapter.dart';
import '../models/chapter_content.dart';

class FalooParser {
  List<Book> parseFreeBooks(String html) {
    final document = html_parser.parse(html);
    final List<Book> booksList = [];
    final books = document.querySelectorAll('ul.novelList > li');
    for (final book in books) {
      final title = book.querySelector('.bl_r1_tit a')?.text.trim();
      final authorElement = book.querySelector('.nl_r1_author a');
      final author = authorElement?.attributes['title']
          ?? authorElement?.text.trim();
      final img = book.querySelector('img.cover')?.attributes['src'];
      final id = book.querySelector('.bl_r1_tit a')?.attributes['href']?.split('/').last.replaceAll('.html', '');
      booksList.add(Book(id: id ?? '0', title: title ?? '未知书名', author: author ?? '未知作者', img: img));
    }
    return booksList;
  }
  // Book  parseBookInfo(String html){
  //
  //   final document = html_parser.parse(html);
  //   final id = document.querySelector('#hidNovelID')?.attributes['value'];
  //   final title =document.querySelector('h1.name')?.text.trim();
  //   final author =document.querySelector(' a.textHide')?.text.trim();
  //   final img = document.querySelector('img.cover')?.attributes['src'];
  //   return Book(id: id ?? '0', title: title ?? '未知书名', author: author ?? '未知作者', img: img );
  // }
  List<Chapter> parseChapterInfo(String html) {
    final document = html_parser.parse(html);
    final chapters = document.querySelectorAll('div.tt a');
    final List<Chapter> chapterList =[];
    for (final chapter in chapters) {
      final href = chapter.attributes['href'];

      if (href == null) {
        continue;
      }
      final fullUrl = Uri.parse(
        'https://wap.faloo.com/',
      ).resolve(href).toString();
      chapterList.add(Chapter(title: chapter.text.trim(), url:fullUrl));

    }
    return chapterList;
  }
  ChapterContent parseChapterContent(String html) {
    final document = html_parser.parse(html);
    final title = document.querySelector('title')?.text.trim();
    final content = document.querySelectorAll('.nodeContent p').map((element) => element.text.trim()).toList();
    return ChapterContent(title: title ?? '未知章节', content: content);
  }

}