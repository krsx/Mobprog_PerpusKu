import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/screens/main_page.dart';
import 'package:mobprog_perpusku/screens/route_page.dart';
import 'package:mobprog_perpusku/theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 30,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Text(
              "Kemudahan Merangkum",
              style: semiBlackBoldTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            Text(
              "Buku Kesukaanmu",
              style: semiBlackBoldTextStyle.copyWith(
                fontSize: 24,
                color: blueColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Simpan setiap hal penting dari bukumu dan tingkatan kualitas membacamu",
              style: lightTextStyle.copyWith(
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "assets/images/Globe.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 80,
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoutePage(),
                  ),
                );
              },
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
          ],
        ),
      ),
    );
  }
}
