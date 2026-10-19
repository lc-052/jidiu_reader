import 'package:flutter/physics.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart'as html_parser;
class SourceRepository {

  Map<String,String?>  parseBookInfo(String html){
    final document = html_parser.parse(html);
    final title =document.querySelector('h1.book')?.text.trim();
    final author =document.querySelector('p.author')?.text.trim();
    return {'title':title,'author':author};
  }

}
void main() {
  const testHtml = '''
  <h1 class="book">测试书名</h1>
  <p class="author">测试作者</p>
  ''';

  final repository = SourceRepository();
  final result = repository.parseBookInfo(testHtml);

  print(result);
}