import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<double> fetchExchangeRate(String base, String target) async {
    final url = 'https://api.exchangerate-api.com/v4/latest/$base';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['rates'][target];
    } else {
      throw Exception('Failed to load exchange rate');
    }
  }
}
