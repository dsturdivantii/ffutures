import 'dart.io';

import 'package:ffutures/model';
import 'package:ffutures/failure';
import 'package:http/http.dart' as http;

class ApiCallClass {

  Future<List<Article>> getNews() async {
    try {
      final news = await http.get(
        Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2021-05-04&sortBy=publishedAt&apiKey=487e3cab81db49ffabd6c04e1175765d"
        );
        if (news.statusCode == 200) {
          final Iterable rawJson = jsonDecode(news.body)["articles"];
          return rawJson.map((article) => Article.fromJson(article)).toList();
      } else {
          throw Failure(message: news.body.toString());
    }
      )
    } on SocketException {
      throw Failure(message: "You are not connected to the Internet");
    } catch(error) {
      throw Failure(message: error.toString());
    }
  }
}