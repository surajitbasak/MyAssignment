import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/quote_providers.dart';

class QuoteDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote Details'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final quoteAsync = ref.watch(quoteProvider(id));

          return quoteAsync.when(
            data: (quote) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quote.content,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '--- ${quote.author} ${quote.dateAdded}',
                          style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
                        )),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Modified on ${quote.dateModified}',
                        style: TextStyle(fontSize: 12.0, color: Colors.green[700]),
                      ),
                    ),
                    SizedBox(
                      height: 40 ,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                        itemCount: quote.tags.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(5.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: const [
                              BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5), spreadRadius: 0.5, blurRadius: 1.0),
                            ]),
                            child: Text("#${quote.tags[index]}"),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
