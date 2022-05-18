import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: blackColor,
          child: PageView(
            children: [
              Container(),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 200,
          color: whiteColor,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(blackColor),
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
            ),
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Text(
                "Jelajahi",
                style: semiWhiteBoldTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
