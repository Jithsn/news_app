import 'package:http/http.dart' as http;
import 'package:news_app/services/newsmode.dart';

class ApiManager {
  String api = '2e3e9cf421ea4828ba714dee77b280be';
  Future<NewsModel> getNews() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$api');
    var responce = await http.get(url);
    if (responce.statusCode == 200) {
      print(responce.body);
      try {
        return newaModelFromJson(responce.body);
      } catch (e) {
        print(e);
      }
    }
    return null;
  }
}
