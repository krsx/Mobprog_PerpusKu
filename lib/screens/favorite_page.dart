import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/card_widget.dart';

import '../widget/genre_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: 0,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
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
              "Rangkumanmu",
              style: semiBlackBoldTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // RangkumanCard(
            //   judul: "Harry Potter",
            //   penulis: "JK Rowling",
            //   isFavorite: true,
            //   genre: [fiksi, horror, petualangan],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // RangkumanCard(
            //   judul: "Harry Potter",
            //   penulis: "JK Rowling",
            //   isFavorite: true,
            //   genre: [fiksi, horror, petualangan],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // RangkumanCard(
            //   judul: "Harry Potter",
            //   penulis: "JK Rowling",
            //   isFavorite: true,
            //   genre: [fiksi, horror, petualangan],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // RangkumanCard(
            //   judul: "Harry Potter",
            //   penulis: "JK Rowling",
            //   isFavorite: true,
            //   genre: [fiksi, horror, petualangan],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // RangkumanCard(
            //   judul: "Harry Potter",
            //   penulis: "JK Rowling",
            //   isFavorite: true,
            //   genre: [fiksi, horror, petualangan],
            // ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
