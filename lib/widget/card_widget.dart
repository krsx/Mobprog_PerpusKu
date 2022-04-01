import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/genre_widget.dart';

class RangkumanCard extends StatefulWidget {
  const RangkumanCard({Key? key}) : super(key: key);

  @override
  State<RangkumanCard> createState() => _RangkumanCardState();
}

class _RangkumanCardState extends State<RangkumanCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 100,
                color: blackColor,
                child: Center(
                  child: Text(
                    "Images",
                    style: mediumWhiteTextSTyle,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Interstellar",
                        style: mediumBlackTextSTyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 2,
                  // ),
                  Text(
                    "by Christhoper Nolan",
                    style: lightTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      fiksi,
                      SizedBox(
                        width: 4,
                      ),
                      petualangan,
                      SizedBox(
                        width: 4,
                      ),
                      thriller,
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
