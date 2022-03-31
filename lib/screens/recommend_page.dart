import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';

class RecoomendationPage extends StatefulWidget {
  const RecoomendationPage({Key? key}) : super(key: key);

  @override
  State<RecoomendationPage> createState() => _RecoomendationPageState();
}

class _RecoomendationPageState extends State<RecoomendationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("Ini Main Page"),
      ),
    );
  }
}
