import 'package:flutter/material.dart';
import '../data_models/quote_model.dart';
import '../services/quote_service.dart' as quote_svc;

class QuoteSection extends StatelessWidget {
  const QuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuoteModel>(
      future: quote_svc.fetchQuoteModel(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting ||
            snap.connectionState == ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) return Center(child: Text('Error: ${snap.error}'));
        final quote = snap.data;
        if (quote == null) {
          return const Center(child: Text('No quote found.'));
        }
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"${quote.quote}"',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  '- ${quote.author}${quote.work.isNotEmpty ? ', ${quote.work}' : ''}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}