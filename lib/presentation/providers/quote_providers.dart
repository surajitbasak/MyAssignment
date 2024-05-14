
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/quote.dart';
import '../../data/remote.dart';
import '../../repository/quote_repository.dart';

final quoteApiProvider = Provider((ref) => QuoteApi());
final quoteRepositoryProvider = Provider((ref) => QuoteRepository(ref.watch(quoteApiProvider)));

final quotesProvider = FutureProvider((ref) {
  return ref.watch(quoteRepositoryProvider).getQuotes();
});

final quoteProvider = FutureProvider.family<Quote, String>((ref, id) {
  return ref.watch(quoteRepositoryProvider).getQuoteById(id);
});