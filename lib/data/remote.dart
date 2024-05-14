import 'package:dio/dio.dart';
import 'package:my_assignment/data/constants.dart';
import 'models/quote.dart';

class QuoteApi {
  final Dio _dio = Dio();

  Future<List<Quote>> fetchQuotes() async {
    final response = await _dio.get(Constants.FetchAllQuotes);
    return (response.data as List).map((x) => Quote.fromJson(x)).toList();
  }

  Future<Quote> fetchQuoteById(String id) async {
    final response = await _dio.get(Constants.FetchQuoteById + id);
    return Quote.fromJson(response.data);
  }
}
