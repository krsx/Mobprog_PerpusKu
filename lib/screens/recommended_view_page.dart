import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/book_collection_providers.dart';

class RecomendationViewPage extends StatefulWidget {
  final index;
  const RecomendationViewPage({Key? key, required this.index})
      : super(key: key);

  @override
  State<RecomendationViewPage> createState() => _RecomendationViewPageState();
}

class _RecomendationViewPageState extends State<RecomendationViewPage> {
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

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 3),
                    color: whiteColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  child: _bookColProvider.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 70,
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(_bookColProvider
                                              .bookCol
                                              ?.items[widget.index]
                                              .volumeInfo
                                              .imageLinks
                                              .smallThumbnail ??
                                          'https://picsum.photos/200/300'))),
                            ),
                            Text(
                              _bookColProvider.bookCol?.items[widget.index]
                                      .volumeInfo.title ??
                                  '',
                              style: semiBlackBoldTextStyle.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "oleh ${_bookColProvider.bookCol?.items[widget.index].volumeInfo.authors[0] ?? ''}",
                              style: lightTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              _bookColProvider.bookCol?.items[widget.index]
                                      .volumeInfo.description ??
                                  '',
                              style: lightTextStyle.copyWith(
                                fontSize: 14,
                                color: blackColor,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  // final url = Uri.parse(_bookColProvider.bookCol
                  //         ?.items[widget.index].volumeInfo.previewLink ??
                  //     '');
                  final url = Uri.parse(
                      "http://books.google.co.id/books?id=ocs3EAAAQBAJ&pg=PP1&dq=%27%27&hl=&cd=1&source=gbs_api");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                    // horizontal: 50,
                  ),
                  child: Text(
                    "Telusuri",
                    style: semiWhiteBoldTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(blackColor),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
