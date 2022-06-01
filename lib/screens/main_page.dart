import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/database/db_rangkuman.dart';
import 'package:mobprog_perpusku/database/model.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/card_widget.dart';
import 'package:mobprog_perpusku/widget/genre_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Rangkuman> rangkuman;
  bool isLoading = false;

  void initState() {
    super.initState();
    refreshList();
  }

  Future refreshList() async {
    setState(() {
      isLoading = true;
    });
    this.rangkuman = await RangkumanDatabase.instance.readAllRangkuman();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
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
                          "Rangkumanmu",
                          style: semiBlackBoldTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Masih belum ada rangkuman, ayo mulai tambahkan rangkumanmu.",
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
                          "Rangkumanmu",
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
                                    mediaPath: '',
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
      ),
    );
  }
}


// ListView(
//             physics: BouncingScrollPhysics(),
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "Perpus",
//                       style: semiBlackBoldTextStyle.copyWith(
//                         fontSize: 24,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "Ku",
//                       style: semiBlackBoldTextStyle.copyWith(
//                         fontSize: 24,
//                         color: blueColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Text(
//                 "Rangkumanmu",
//                 style: semiBlackBoldTextStyle.copyWith(
//                   fontSize: 16,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               RangkumanCard(
//                 judul: "Laskar Pelangi",
//                 penulis: "Andrea Hirata",
//                 isFavorite: false,
//                 genre: [romansa, pengembanganDiri, petualangan],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               RangkumanCard(
//                 judul: "Harry Potter",
//                 penulis: "JK Rowling",
//                 isFavorite: false,
//                 genre: [fiksi, horror, petualangan],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               RangkumanCard(
//                 judul: "Don Quixote",
//                 penulis: "JK Rowling",
//                 isFavorite: false,
//                 genre: [pengembanganDiri, romansa],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               RangkumanCard(
//                 judul: "Interstellar",
//                 penulis: "Christopher Nolan",
//                 isFavorite: false,
//                 genre: [fiksi, thriller, petualangan],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               RangkumanCard(
//                 judul: "The Secret History",
//                 penulis: "Dona Tart",
//                 isFavorite: false,
//                 genre: [fiksi, romansa, petualangan],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               RangkumanCard(
//                 judul: "Harry Potter",
//                 penulis: "JK Rowling",
//                 isFavorite: false,
//                 genre: [fiksi, horror, petualangan],
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//             ],
//           ),
