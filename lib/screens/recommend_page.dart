import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';

class RecomendationPage extends StatefulWidget {
  const RecomendationPage({Key? key}) : super(key: key);

  @override
  State<RecomendationPage> createState() => _RecomendationPageState();
}

class _RecomendationPageState extends State<RecomendationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("Ini Recomendation Page"),
      ),
    );
  }
}
