import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/screens/route_page.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Container(
          color: whiteColor,
          child: PageView(
            physics: BouncingScrollPhysics(),
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                  imageUrl: 'assets/images/Globe.png',
                  title: "Buku Adalah",
                  titleBlue: "Jendela Ilmu",
                  subtitle:
                      "Luangkan waktu mu untuk membaca buku \nsetiap hari"),
              buildPage(
                  imageUrl: 'assets/images/Failure.png',
                  title: "Catat dan Ingat\n",
                  titleBlue: "Setiap Hal Penting",
                  subtitle:
                      "Simpan setiap progress dan hal penting dari buku yang telah dibaca"),
              buildPage(
                  imageUrl: 'assets/images/Writing.png',
                  title: "Kemudahan Merangkum",
                  titleBlue: "Buku Kesukaanmu",
                  subtitle:
                      "Stop membuang waktu membaca buku kesukaanmu berulang kali"),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? Container(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingHorizontal,
                ),
                height: 200,
                width: double.infinity,
                color: whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        activeDotColor: blackColor,
                        dotColor: greyColor,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(blackColor),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RoutePage(),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Center(
                          child: Text(
                            "Jelajahi",
                            style: semiWhiteBoldTextStyle.copyWith(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingHorizontal,
                ),
                height: 200,
                width: double.infinity,
                color: whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        activeDotColor: blackColor,
                        dotColor: greyColor,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(blackColor),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      onPressed: () => controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Center(
                          child: Text(
                            "Selanjutnya",
                            style: semiWhiteBoldTextStyle.copyWith(
                              fontSize: 24,
                            ),
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

class buildPage extends StatelessWidget {
  const buildPage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.titleBlue,
    required this.subtitle,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String titleBlue;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset(
                imageUrl,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: semiBlackBoldTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  TextSpan(
                    text: " ",
                  ),
                  TextSpan(
                    text: titleBlue,
                    style: semiBlackBoldTextStyle.copyWith(
                      fontSize: 24,
                      color: blueColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              style: lightTextStyle.copyWith(
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
