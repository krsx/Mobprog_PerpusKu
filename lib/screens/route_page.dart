import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/auth/fire_auth.dart';
import 'package:mobprog_perpusku/screens/favorite_page.dart';
import 'package:mobprog_perpusku/screens/introduction_page.dart';
import 'package:mobprog_perpusku/screens/main_page.dart';
import 'package:mobprog_perpusku/screens/recommend_page.dart';
import 'package:mobprog_perpusku/screens/search_page.dart';
import 'package:mobprog_perpusku/screens/tambah_rangkuman_page.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/dashboard_widget.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({
    Key? key,
  }) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int selectedIndex = 0;
  final screens = [
    MainPage(),
    FavoritePage(),
    RecomendationPage(),
    SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: blackColor),
          backgroundColor: whiteColor,
          elevation: 0,
          title: Row(
            children: [
              SizedBox(
                width: 8,
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
            ],
          ),
        ),
        endDrawer: Drawer(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masuk sebagai',
                    style: semiBlackBoldTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    dataEmail ?? '',
                    style: semiBlackBoldTextStyle.copyWith(
                        color: blueColor, fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
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
                    onPressed: () async {
                      FireAuth.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IntroductionPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Center(
                        child: Text(
                          "Keluar",
                          style: semiWhiteBoldTextStyle.copyWith(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
        extendBody: false,
        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
        backgroundColor: whiteColor,
        floatingActionButton: keyboardIsOpened
            ? SizedBox()
            : FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TambahRangkuman(),
                    ),
                  );
                },
                // onPressed: () => Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => TambahRangkumanPage(),
                //   ),
                // ),
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
                elevation: 0,
                backgroundColor: blueColor,
                // shape: Border.all(width: 2, color: whiteColor),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: DashboardWidget(
          index: selectedIndex,
          onChangedTab: onChangedTab,
        ),
      ),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.selectedIndex = index;
    });
  }
}
