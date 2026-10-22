import 'package:html/parser.dart' as html_parser;
import '../models/book.dart';
import '../models/chapter.dart';
import '../models/chapter_content.dart';
class SeventeenKParser {
  List<Book> parseBookList(String html) {
    final document = html_parser.parse(html);
    List<Book> books = [];

    return books;
  }
}