import 'package:flutter/material.dart';
import 'package:quote_clean_archituctre/features/quote/domain/entities/quote.dart';

class QuoteContent extends StatelessWidget {
  final Quote quote;
  const QuoteContent({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text(quote.quote,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text(quote.author,
                style: Theme.of(context).textTheme.bodyMedium),
          )
        ],
      ),
    );
  }
}
