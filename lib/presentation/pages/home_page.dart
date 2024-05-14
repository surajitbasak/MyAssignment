import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/quote_providers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: const Text('Quotes'),
      ),
      body: Consumer(
        key: const ValueKey('Quote-Consumer'),
        builder: (context, ref, child) {
          final quotesAsync = ref.watch(quotesProvider);
          return quotesAsync.when(
            data: (quotes) {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                itemCount: quotes.length,
                itemBuilder: (context, index) {
                  final quote = quotes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/quote_details',
                        arguments: quote.id,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: const [
                        BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5), spreadRadius: 0.5, blurRadius: 1.0),
                      ]),
                      child: Column(
                        children: [
                          Text(
                            quote.content,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 5),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '--- ${quote.author}',
                                style: TextStyle(fontSize: 12.0, color: Colors.grey[700]),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
          );
        },
      ),
    );
  }
}
