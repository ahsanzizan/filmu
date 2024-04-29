import "dart:io";
import "package:http/http.dart" as http;

const String baseUrl = "https://api.themoviedb.org/3/movie";
const String apiKey = "?api_key=a2df3d1a7611194432bbdf1fc80540f2";

class HttpService {
  Future<dynamic> get(String path, {Map<String, String>? headers}) async {
    try {
      final response =
          await http.get(Uri.parse(baseUrl + path + apiKey), headers: headers);

      if (response.statusCode == HttpStatus.ok) {
        return response.body;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
