import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/database/db_rangkuman.dart';
import 'package:mobprog_perpusku/database/models/rangkuman.dart';
import 'package:mobprog_perpusku/screens/route_page.dart';
import 'package:mobprog_perpusku/screens/tambah_rangkuman_page.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/genre_widget.dart';

import '../widget/genre_widget.dart';

class RangkumanPage extends StatefulWidget {
  final int readId;
  const RangkumanPage({Key? key, required this.readId}) : super(key: key);

  @override
  State<RangkumanPage> createState() => _RangkumanPageState();
}

class _RangkumanPageState extends State<RangkumanPage> {
  late Rangkuman rangkuman;
  bool isLoading = false;
  List<Widget> genre = [];

  void isiGenre() {
    genre.clear();
    genre.add(Container());
    if (rangkuman.horror) genre.add(horror);
    if (rangkuman.petualangan) genre.add(petualangan);
    if (rangkuman.pengembanganDiri) genre.add(pengembanganDiri);
    if (rangkuman.komedi) genre.add(komedi);
    if (rangkuman.romansa) genre.add(romansa);
    if (rangkuman.fiksi) genre.add(fiksi);
    if (rangkuman.thriller) genre.add(thriller);
    if (rangkuman.misteri) genre.add(misteri);
  }

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);
    this.rangkuman =
        await RangkumanDatabase.instance.readRangkuman(widget.readId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    isiGenre();

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView(
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
                        Icon(
                          Icons.favorite,
                          size: 26,
                          color: (rangkuman.favorit) ? blueColor : whiteColor,
                        )
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rangkuman.judul,
                              style: semiBlackBoldTextStyle.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "oleh ${rangkuman.penulis}",
                              style: lightTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 405),
                              child: Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: genre,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              rangkuman.deskripsi,
                              style: lightTextStyle.copyWith(
                                fontSize: 14,
                                color: blackColor,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),

                    // UNTUK MEDIA [JANGAN DIHAPUS]
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(12),
                    //       border: Border.all(width: 3),
                    //       color: whiteColor),
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(
                    //       horizontal: 24,
                    //       vertical: 30,
                    //     ),
                    //     child: Column(
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Container(
                    //               color: blackColor,
                    //               width: 120,
                    //               height: 200,
                    //               child: Center(
                    //                 child: Text(
                    //                   "Media",
                    //                   style: semiWhiteBoldTextStyle.copyWith(
                    //                       fontSize: 14),
                    //                 ),
                    //               ),
                    //             ),
                    //             Container(
                    //               color: blackColor,
                    //               width: 120,
                    //               height: 200,
                    //               child: Center(
                    //                 child: Text(
                    //                   "Media",
                    //                   style: semiWhiteBoldTextStyle.copyWith(
                    //                       fontSize: 14),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           height: 20,
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Container(
                    //               color: blackColor,
                    //               width: 120,
                    //               height: 200,
                    //               child: Center(
                    //                 child: Text(
                    //                   "Media",
                    //                   style: semiWhiteBoldTextStyle.copyWith(
                    //                       fontSize: 14),
                    //                 ),
                    //               ),
                    //             ),
                    //             Container(
                    //               color: blackColor,
                    //               width: 120,
                    //               height: 200,
                    //               child: Center(
                    //                 child: Text(
                    //                   "Media",
                    //                   style: semiWhiteBoldTextStyle.copyWith(
                    //                       fontSize: 14),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 460,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TambahRangkuman(
                                  rangkuman: rangkuman,
                                ),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                // horizontal: 50,
                              ),
                              child: Text(
                                "Edit",
                                style: semiWhiteBoldTextStyle.copyWith(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(blueColor),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text(
                                  "Hapus Rangkuman?",
                                  style: semiBlackBoldTextStyle,
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(children: [
                                    Text(
                                      "Rangkuman ini akan dihapus secara permanen. Pastikan anda yakin ingin menghapus rangkuman ini.",
                                      style: regularBlackTextSTyle.copyWith(
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ]),
                                ),
                                actions: [
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(blackColor),
                                      textStyle: MaterialStateProperty.all(
                                        TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      await RangkumanDatabase.instance
                                          .deleteRangkuman(widget.readId);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RoutePage()));
                                    },
                                    child: Text(
                                      "Ya",
                                      style: semiBlackBoldTextStyle.copyWith(
                                          color: whiteColor),
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(blueColor),
                                      textStyle: MaterialStateProperty.all(
                                        TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      "Tidak",
                                      style: semiBlackBoldTextStyle.copyWith(
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                // horizontal: 50,
                              ),
                              child: Text(
                                "Hapus",
                                style: semiWhiteBoldTextStyle.copyWith(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(blackColor),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

// ListView(
//             physics: BouncingScrollPhysics(),
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: Icon(
//                       Icons.arrow_back,
//                       size: 25,
//                     ),
//                   ),
//                   Spacer(),
//                   Icon(
//                     Icons.favorite,
//                     size: 26,
//                     color: isFavorite ? blueColor : whiteColor,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(width: 3),
//                     color: whiteColor),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 24,
//                     vertical: 30,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Interstellar",
//                         style: semiBlackBoldTextStyle.copyWith(
//                           fontSize: 20,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         "by Christhoper Nolan",
//                         style: lightTextStyle.copyWith(
//                           fontSize: 14,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       ConstrainedBox(
//                         constraints: BoxConstraints(maxWidth: 405),
//                         child: Wrap(
//                           spacing: 5,
//                           runSpacing: 5,
//                           children: [
//                             horror,
//                             fiksi,
//                             petualangan,
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         "Risus et a nam at quis mauris posuere tellus. Non turpis vel massa, sodales. Venenatis, turpis vel egestas diam id. Volutpat id sagittis, nisl sed euismod tempus. Pharetra, massa velit, lorem mauris amet.",
//                         style: lightTextStyle.copyWith(
//                           fontSize: 14,
//                           color: blackColor,
//                         ),
//                         textAlign: TextAlign.justify,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),

//               // UNTUK MEDIA [JANGAN DIHAPUS]
//               // Container(
//               //   decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(12),
//               //       border: Border.all(width: 3),
//               //       color: whiteColor),
//               //   child: Padding(
//               //     padding: EdgeInsets.symmetric(
//               //       horizontal: 24,
//               //       vertical: 30,
//               //     ),
//               //     child: Column(
//               //       children: [
//               //         Row(
//               //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //           children: [
//               //             Container(
//               //               color: blackColor,
//               //               width: 120,
//               //               height: 200,
//               //               child: Center(
//               //                 child: Text(
//               //                   "Media",
//               //                   style: semiWhiteBoldTextStyle.copyWith(
//               //                       fontSize: 14),
//               //                 ),
//               //               ),
//               //             ),
//               //             Container(
//               //               color: blackColor,
//               //               width: 120,
//               //               height: 200,
//               //               child: Center(
//               //                 child: Text(
//               //                   "Media",
//               //                   style: semiWhiteBoldTextStyle.copyWith(
//               //                       fontSize: 14),
//               //                 ),
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //         SizedBox(
//               //           height: 20,
//               //         ),
//               //         Row(
//               //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //           children: [
//               //             Container(
//               //               color: blackColor,
//               //               width: 120,
//               //               height: 200,
//               //               child: Center(
//               //                 child: Text(
//               //                   "Media",
//               //                   style: semiWhiteBoldTextStyle.copyWith(
//               //                       fontSize: 14),
//               //                 ),
//               //               ),
//               //             ),
//               //             Container(
//               //               color: blackColor,
//               //               width: 120,
//               //               height: 200,
//               //               child: Center(
//               //                 child: Text(
//               //                   "Media",
//               //                   style: semiWhiteBoldTextStyle.copyWith(
//               //                       fontSize: 14),
//               //                 ),
//               //               ),
//               //             ),
//               //           ],
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       // onPressed: () => Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //     builder: (context) => TambahRangkuman(),
//                       //   ),
//                       // ),
//                       onPressed: () {},
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 12,
//                           // horizontal: 50,
//                         ),
//                         child: Text(
//                           "Edit",
//                           style: semiWhiteBoldTextStyle.copyWith(
//                             fontSize: 24,
//                           ),
//                         ),
//                       ),
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(blueColor),
//                         elevation: MaterialStateProperty.all(0),
//                         shape: MaterialStateProperty.all(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(17),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () => showDialog(
//                         context: context,
//                         builder: (_) => AlertDialog(
//                           title: Text(
//                             "Hapus Rangkuman?",
//                             style: semiBlackBoldTextStyle,
//                           ),
//                           content: SingleChildScrollView(
//                             child: ListBody(children: [
//                               Text(
//                                 "Rangkuman ini akan dihapus secara permanen. Pastikan anda yakin ingin menghapus rangkuman ini.",
//                                 style: regularBlackTextSTyle.copyWith(
//                                   fontSize: 12,
//                                 ),
//                                 textAlign: TextAlign.justify,
//                               ),
//                             ]),
//                           ),
//                           actions: [
//                             TextButton(
//                               style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.all(blackColor),
//                                 textStyle: MaterialStateProperty.all(
//                                   TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: whiteColor,
//                                   ),
//                                 ),
//                               ),
//                               onPressed: () {},
//                               child: Text(
//                                 "Ya",
//                                 style: mediumBlackTextSTyle.copyWith(
//                                     color: whiteColor),
//                               ),
//                             ),
//                             TextButton(
//                               style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.all(blueColor),
//                                 textStyle: MaterialStateProperty.all(
//                                   TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     color: whiteColor,
//                                   ),
//                                 ),
//                               ),
//                               onPressed: () => Navigator.pop(context),
//                               child: Text(
//                                 "Tidak",
//                                 style: mediumBlackTextSTyle.copyWith(
//                                   color: whiteColor,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 12,
//                           // horizontal: 50,
//                         ),
//                         child: Text(
//                           "Hapus",
//                           style: semiWhiteBoldTextStyle.copyWith(
//                             fontSize: 24,
//                           ),
//                         ),
//                       ),
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(blackColor),
//                         elevation: MaterialStateProperty.all(0),
//                         shape: MaterialStateProperty.all(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(17),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//             ],
//           ),