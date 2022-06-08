import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/providers/book_collection_providers.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/card_rekomendasi_widget.dart';
import 'package:provider/provider.dart';

class RecomendationPage extends StatefulWidget {
  const RecomendationPage({Key? key}) : super(key: key);

  @override
  State<RecomendationPage> createState() => _RecomendationPageState();
}

class _RecomendationPageState extends State<RecomendationPage> {
  @override
  void initState() {
    super.initState();
    final _bookColProvider = Provider.of<BookCollectionProvider>(
      context,
      listen: false,
    ).getBookCollection();
  }

  @override
  Widget build(BuildContext context) {
    final _bookColProvider = Provider.of<BookCollectionProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Perpus",
                      style: semiBlackBoldTextStyle.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    TextSpan(
                      text: "Ku",
                      style: semiBlackBoldTextStyle.copyWith(
                        fontSize: 24,
                        color: blueColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Rekomendasimu",
                style: semiBlackBoldTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              _bookColProvider.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CardRekomendasi(
                              title: _bookColProvider
                                      .bookCol?.items[index].volumeInfo.title ??
                                  '',
                              author: _bookColProvider.bookCol?.items[index]
                                      .volumeInfo.authors[0] ??
                                  '',
                              thumbnail: _bookColProvider.bookCol?.items[index].volumeInfo.imageLinks.smallThumbnail ?? 
                              'https://picsum.photos/200/300',
                            ),
                          );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
