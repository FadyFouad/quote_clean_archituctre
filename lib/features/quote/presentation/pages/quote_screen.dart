import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quote_clean_archituctre/features/quote/presentation/cubit/quote_cubit.dart';
import 'package:quote_clean_archituctre/features/quote/presentation/widgets/quote_content.dart';
import 'package:quote_clean_archituctre/features/splash/presentation/cubit/local_cubit.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  _getRandomQuote() {
    BlocProvider.of<QuoteCubit>(context).getRandomQuote();

    // if (AppLocalizations.of(context)!.localeName == 'en') {
    //   BlocProvider.of<LocalCubit>(context).toArabic();
    // } else {
    // BlocProvider.of<LocalCubit>(context).toEnglish();
    // }
  }

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
    final appBar = AppBar(
      title: Text(AppLocalizations.of(context)!.appName),
      actions: [
        InkWell(
            onTap: () {
              print(AppLocalizations.of(context)!.localeName);
              if (AppLocalizations.of(context)!.localeName == 'ar') {
                BlocProvider.of<LocalCubit>(context).toEnglish();
              } else {
                BlocProvider.of<LocalCubit>(context).toArabic();
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.language),
            )),
      ],
    );
    return RefreshIndicator(
        child: Scaffold(appBar: appBar, body: _buildBodyContent()),
        onRefresh: () => _getRandomQuote());
  }
}
