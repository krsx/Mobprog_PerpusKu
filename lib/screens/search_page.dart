import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/database/db_rangkuman.dart';
import 'package:mobprog_perpusku/database/models/rangkuman.dart';
import 'package:mobprog_perpusku/theme.dart';

import '../widget/card_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Rangkuman> rangkuman;
  List<Rangkuman> rangkumanTemp = [];
  String query = '';
  bool isLoading = false;

  void initState() {
    super.initState();
    refreshList();
  }

  Future refreshList() async {
    setState(() => isLoading = true);
    this.rangkuman = await RangkumanDatabase.instance.readAllRangkuman();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: 0,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // SizedBox(
            //   height: 30,
            // ),
            // RichText(
            //   text: TextSpan(
            //     children: [
            //       TextSpan(
            //         text: "Perpus",
            //         style: semiBlackBoldTextStyle.copyWith(
            //           fontSize: 24,
            //         ),
            //       ),
            //       TextSpan(
            //         text: "Ku",
            //         style: semiBlackBoldTextStyle.copyWith(
            //           fontSize: 24,
            //           color: blueColor,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Pencarianmu",
              style: semiBlackBoldTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                color: greyColor,
              ),
              decoration: InputDecoration(
                fillColor: greyColor,
                focusColor: greyColor,
                suffixIcon: Icon(Icons.search),
                suffixIconColor: greyColor,
                hintText: "Search",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 2,
                    color: blackColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 2,
                    color: blackColor,
                  ),
                ),
              ),
              onChanged: (value) {
                searchRangkuman(value);
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: rangkumanTemp.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      RangkumanCard(
                        id: rangkumanTemp[index].id!,
                        favorite: rangkumanTemp[index].favorit,
                        judul: rangkumanTemp[index].judul,
                        penulis: rangkumanTemp[index].penulis,
                        mediaPath: '',
                        horror: rangkumanTemp[index].horror,
                        petualangan: rangkumanTemp[index].petualangan,
                        pengembanganDiri: rangkumanTemp[index].pengembanganDiri,
                        komedi: rangkumanTemp[index].komedi,
                        romansa: rangkumanTemp[index].romansa,
                        fiksi: rangkumanTemp[index].fiksi,
                        thriller: rangkumanTemp[index].thriller,
                        misteri: rangkumanTemp[index].misteri,
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

  void searchRangkuman(String query) {
    // print("query: ${query}");
    final books = rangkuman.where((book) {
      final titleLower = book.judul.toLowerCase();
      final authorLower = book.penulis.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();
    // print("books :${books}");
    setState(() {
      if (query == '' || query.isEmpty) {
        rangkumanTemp.clear();
      } else {
        this.query = query;
        this.rangkumanTemp = books;
      }
    });
    // print(rangkumanTemp);
  }
}
