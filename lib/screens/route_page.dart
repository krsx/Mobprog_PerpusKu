import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/screens/favorite_page.dart';
import 'package:mobprog_perpusku/screens/main_page.dart';
import 'package:mobprog_perpusku/screens/recommend_page.dart';
import 'package:mobprog_perpusku/screens/search_page.dart';
import 'package:mobprog_perpusku/screens/tambah_rangkuman_page.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/dashboard_widget.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

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
