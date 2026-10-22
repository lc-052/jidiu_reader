import 'package:jidiu_reader/data/source_repository.dart';
import 'package:jidiu_reader/models/book.dart';

Future<void> main() async {
  print("开始请求");
  final html =await SourceRepository().fetchBookHtml('https://www.17k.com/top/refactor/top100/06_vipclick/06_click_freeBook_top_100_pc.html');
  print('你好');
}