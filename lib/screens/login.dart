import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/auth/fire_auth.dart';
import 'package:mobprog_perpusku/screens/register.dart';
import 'package:mobprog_perpusku/screens/route_page.dart';
import 'package:mobprog_perpusku/theme.dart';

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: 120,
                  ),
                  Text(
                    "Login",
                    style: semiBlackBoldTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: greyColor,
                    ),
                    decoration: InputDecoration(
                      fillColor: greyColor,
                      focusColor: greyColor,
                      suffixIcon: Icon(Icons.account_circle),
                      suffixIconColor: greyColor,
                      hintText: "Email",
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
                    controller: _emailController,
                    validator: (value) => Validator.validateEmail(email: value),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: greyColor,
                    ),
                    decoration: InputDecoration(
                      fillColor: greyColor,
                      focusColor: greyColor,
                      suffixIcon: Icon(Icons.lock),
                      suffixIconColor: greyColor,
                      hintText: "Password",
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
                    controller: _passwordController,
                    validator: (value) =>
                        Validator.validatePassword(password: value),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tidak punya akun? ",
                          style: regularBlackTextSTyle.copyWith(
                            color: greyColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          ),
                          child: Text(
                            "Daftar disini",
                            style: lightTextStyle.copyWith(
                              color: blueColor,
                            ),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              EdgeInsets.all(0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 130,
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
                      User? user = await FireAuth.signInUsingEmailPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context,
                      );
                      if (_formKey.currentState!.validate() && user != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => RoutePage()),
                        );
                      }
                      // if (user != null) {
                      //   Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (context) => RoutePage()),
                      //   );
                      // }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Center(
                        child: Text(
                          "Masuk",
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
        ),
      ),
    );
  }
}
