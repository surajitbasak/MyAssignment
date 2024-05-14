
import '../../data/models/quote.dart';
import '../data/remote.dart';

class QuoteRepository {
  final QuoteApi _api;

  QuoteRepository(this._api);

  Future<List<Quote>> getQuotes() {
    return _api.fetchQuotes();
  }

  Future<Quote> getQuoteById(String id) {
    return _api.fetchQuoteById(id);
  }
}