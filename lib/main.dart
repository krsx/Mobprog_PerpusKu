import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/providers/book_collection_providers.dart';
import 'package:mobprog_perpusku/screens/introduction_page.dart';
import 'package:mobprog_perpusku/screens/route_page.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookCollectionProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: whiteColor,
        ),
        home: RoutePage(),
      ),
    );
  }
}