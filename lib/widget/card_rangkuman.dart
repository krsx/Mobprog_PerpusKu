import 'package:flutter/material.dart';

import '../theme.dart';

class RangkumanCardNew extends StatefulWidget {
  const RangkumanCardNew({Key? key}) : super(key: key);

  @override
  State<RangkumanCardNew> createState() => _RangkumanCardNewState();
}

class _RangkumanCardNewState extends State<RangkumanCardNew> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    Icon(
                      Icons.favorite,
                      size: 20,
                      // color: widget.favorite ? blueColor : whiteColor,
                      color: blueColor,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
