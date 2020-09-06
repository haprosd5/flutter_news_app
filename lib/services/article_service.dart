import 'package:project_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;


var urlCountry = (String country) => 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=ebe40e51702242b28b94b1fbd53f28c5';
Future<List<ArticleModel>> getTopArticleFromUs() async {
  var response = await http.get(urlCountry);
  try {
    if (response.statusCode == 200) {
      final result = response.body as List;
      print(result);
      return result;
    }
  } catch(Exception) {
    throw Exception('Bi loi roi');
  }
}