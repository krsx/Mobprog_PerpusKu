import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/card_widget.dart';

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
            vertical: paddingHorizontal,
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
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
              RangkumanCard(),
              SizedBox(
                height: 20,
              ),
              RangkumanCard(),
              SizedBox(
                height: 20,
              ),
              RangkumanCard(),
              SizedBox(
                height: 20,
              ),
              RangkumanCard(),
              SizedBox(
                height: 20,
              ),
              RangkumanCard(),
              SizedBox(
                height: 20,
              ),
              RangkumanCard(),
            ],
          ),
        ),
      ),
    );
  }
}
