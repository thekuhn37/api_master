import 'package:http/http.dart' as http;

class ApiService {
  final String baseURL = "https://movies-api.nomadcoders.workers.dev";
  final String popular = "popular";

  void getPopMovies() async {
    final url = Uri.parse('$baseURL/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
