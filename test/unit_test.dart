import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_assignment/data/models/quote.dart';
import 'package:my_assignment/data/remote.dart';
import 'package:my_assignment/repository/quote_repository.dart';

class MockQuoteApi extends Mock implements QuoteApi {}

void main() {
  group('QuoteRepository', () {
    late QuoteRepository repository;
    late MockQuoteApi mockApi;

    setUp(() {
      mockApi = MockQuoteApi();
      repository = QuoteRepository(mockApi);
    });

    test('getQuoteById() returns a quote by ID', () async {
      // Arrange
      final id = 'bAHGv1WELu';
      final expectedQuote = Quote(
          id: 'bAHGv1WELu',
          content: 'Music is a higher revelation than all wisdom and philosophy.',
          author: 'Ludwig van Beethoven',
          tags: ["Wisdom"],
          dateAdded: '2020-04-14',
          dateModified: '2023-04-14');

      when(mockApi.fetchQuoteById(id)).thenAnswer((_) async => expectedQuote);

  
      final quote = await repository.getQuoteById(id);

    
      expect(quote, equals(expectedQuote));
    });
  });
}
