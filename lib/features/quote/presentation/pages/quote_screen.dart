import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_clean_archituctre/features/quote/presentation/cubit/quote_cubit.dart';
import 'package:quote_clean_archituctre/features/quote/presentation/widgets/quote_content.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() => BlocProvider.of<QuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<QuoteCubit, QuoteState>(builder: ((context, state) {
      if (state is QuoteLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is QuoteError) {
        return Text(state.failure.toString());
      } else if (state is QuoteLoaded) {
        return Column(
          children: [
            QuoteContent(
              quote: state.quote,
            ),
            InkWell(
                onTap: () => _getRandomQuote(),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blueAccent),
                  child: const Icon(
                    Icons.refresh,
                    size: 28,
                    color: Colors.white,
                  ),
                ))
          ],
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    return RefreshIndicator(
        child: Scaffold(appBar: appBar, body: _buildBodyContent()),
        onRefresh: () => _getRandomQuote());
  }
}
