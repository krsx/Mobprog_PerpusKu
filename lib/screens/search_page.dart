import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}
