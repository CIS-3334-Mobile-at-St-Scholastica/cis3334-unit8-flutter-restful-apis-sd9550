import 'package:http/http.dart' as http;
import '../data_models/quote_model.dart';

/// Fetches quotes from API Ninjas
Future<QuoteModel> fetchQuoteModel() async {
  final url = Uri.parse('https://api.api-ninjas.com/v2/quotes?categories=success,wisdom');
  final headers = {
    'X-Api-Key': 'O9Kfxm3FlLIpCPN8xSbR/g==GqOKoJQkxJZ0TpzO',
  };
  final resp = await http.get(url, headers: headers);

  if (resp.statusCode != 200) {
    throw Exception('Quotes API ${resp.statusCode}: ${resp.body}');
  }

  // first quote is the one we want
  final List<QuoteModel> quotes = welcomeFromJson(resp.body);
  if (quotes.isEmpty) {
    throw Exception('No quotes found');
  }

  return quotes.first;
}