import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/database/db_rangkuman.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/card_widget.dart';

import '../database/models/rangkuman.dart';
import '../widget/genre_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late List<Rangkuman> rangkuman;
  bool isLoading = false;

  void initState() {
    super.initState();
    refreshList();
  }

  Future refreshList() async {
    setState(() => isLoading = true);
    this.rangkuman = await RangkumanDatabase.instance.readAllRangkuman();
    rangkuman.removeWhere((item) => !item.favorit);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: 0,
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : rangkuman.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        height: 30,
                      ),
                      Text(
                        "Favoritmu",
                        style: semiBlackBoldTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Masih belum ada favorit, ayo mulai tambahkan rangkuman favoritmu.",
                        style: lightTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        height: 30,
                      ),
                      Text(
                        "Favoritmu",
                        style: semiBlackBoldTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: rangkuman.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                RangkumanCard(
                                  id: rangkuman[index].id!,
                                  favorite: rangkuman[index].favorit,
                                  judul: rangkuman[index].judul,
                                  penulis: rangkuman[index].penulis,
                                  mediaPath: rangkuman[index].mediaPath,
                                  horror: rangkuman[index].horror,
                                  petualangan: rangkuman[index].petualangan,
                                  pengembanganDiri:
                                      rangkuman[index].pengembanganDiri,
                                  komedi: rangkuman[index].komedi,
                                  romansa: rangkuman[index].romansa,
                                  fiksi: rangkuman[index].fiksi,
                                  thriller: rangkuman[index].thriller,
                                  misteri: rangkuman[index].misteri,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}

// ListView(
//           physics: BouncingScrollPhysics(),
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: "Perpus",
//                     style: semiBlackBoldTextStyle.copyWith(
//                       fontSize: 24,
//                     ),
//                   ),
//                   TextSpan(
//                     text: "Ku",
//                     style: semiBlackBoldTextStyle.copyWith(
//                       fontSize: 24,
//                       color: blueColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Rangkumanmu",
//               style: semiBlackBoldTextStyle.copyWith(
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             SizedBox(
//               height: 30,
//             ),
//           ],
//         ),