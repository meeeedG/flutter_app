import 'dart:convert';
import 'package:http/http.dart' as http;

class MeteoService {
  static const String _apiKey = 'd1c67704f35a14487bbf7f2ae6400b30';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final encoded = Uri.encodeComponent(city.trim());
    final url = Uri.parse('$_baseUrl?q=$encoded&appid=$_apiKey&units=metric&lang=fr');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load weather: ${response.statusCode} ${response.body}');
    }
  }
}
