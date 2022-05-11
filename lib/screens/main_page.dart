import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/card_widget.dart';
import 'package:mobprog_perpusku/widget/genre_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              RangkumanCard(
                judul: "Laskar Pelangi",
                penulis: "Andrea Hirata",
                isFavorite: false,
                genre: [romansa, pengembanganDiri, petualangan],
              ),
              SizedBox(
                height: 20,
              ),
              RangkumanCard(
                judul: "Harry Potter",
                penulis: "JK Rowling",
                isFavorite: false,
                genre: [fiksi, horror, petualangan],
              ),
              SizedBox(
                height: 20,
              ),
              RangkumanCard(
                judul: "Don Quixote",
                penulis: "JK Rowling",
                isFavorite: false,
                genre: [pengembanganDiri, romansa],
              ),
              SizedBox(
                height: 20,
              ),
              RangkumanCard(
                judul: "Interstellar",
                penulis: "Christopher Nolan",
                isFavorite: false,
                genre: [fiksi, thriller, petualangan],
              ),
              SizedBox(
                height: 20,
              ),
              RangkumanCard(
                judul: "The Secret History",
                penulis: "Dona Tart",
                isFavorite: false,
                genre: [fiksi, romansa, petualangan],
              ),
              SizedBox(
                height: 20,
              ),
              RangkumanCard(
                judul: "Harry Potter",
                penulis: "JK Rowling",
                isFavorite: false,
                genre: [fiksi, horror, petualangan],
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
