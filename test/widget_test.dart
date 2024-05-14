import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_assignment/data/models/quote.dart';
import 'package:my_assignment/presentation/pages/home_page.dart';
import 'package:my_assignment/presentation/providers/quote_providers.dart';

void main() {
  testWidgets('HomePage Widget Test', (WidgetTester tester) async {
    final mockQuotes = [
      Quote(
        id: 'XtZMaD2s28',
        content: 'If we all did the things we are capable of doing, we would literally astound ourselves.',
        author: 'Thomas Edison',
        tags: ['Inspirational', 'Motivational'],
        dateAdded: '2023-04-14',
        dateModified: '2023-04-14',
      ),
    ];

    final mockQuoteProvider = FutureProvider<List<Quote>>((ref) async => mockQuotes);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          quotesProvider.overrideWithProvider(mockQuoteProvider),
        ],
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    expect(find.byKey(const ValueKey('Quote-Consumer')), findsOneWidget);
  });
}
