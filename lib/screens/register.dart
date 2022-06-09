import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/auth/fire_auth.dart';
import 'package:mobprog_perpusku/screens/route_page.dart';
import 'package:mobprog_perpusku/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passController = TextEditingController(text: '');
  final TextEditingController _confirmPassController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
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
                    height: 80,
                  ),
                  Text(
                    "Buat Akun  ",
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
                    controller: _passController,
                    validator: (value) =>
                        Validator.validatePassword(password: value),
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
                      hintText: "Konfirmasi Password",
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
                    controller: _confirmPassController,
                  ),
                  SizedBox(
                    height: 160,
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
                      User? user = await FireAuth.registerUsingEmailPassword(
                        name: _emailController.text,
                        email: _emailController.text,
                        password: _passController.text,
                      );
                      if (user != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => RoutePage()),
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Center(
                        child: Text(
                          "Daftar",
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
          ),
        ),
      ),
    );
  }
}
