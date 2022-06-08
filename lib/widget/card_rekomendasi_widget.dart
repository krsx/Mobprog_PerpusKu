import 'package:flutter/material.dart';

import '../theme.dart';

class CardRekomendasi extends StatefulWidget {
  const CardRekomendasi({Key? key, required this.title, required this.author, required this.thumbnail,})
      : super(key: key);

  final String title;
  final String author;
  final String thumbnail;

  @override
  State<CardRekomendasi> createState() => _CardRekomendasiState();
}

class _CardRekomendasiState extends State<CardRekomendasi> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                // Row(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Spacer(),
                //     Icon(
                //       Icons.favorite,
                //       size: 20,
                //       color: widget.favorite ? blueColor : whiteColor,
                //     ),
                //   ],
                // ),
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: mediumBlackTextSTyle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.author,
                      overflow: TextOverflow.ellipsis,
                      style: lightTextStyle.copyWith(
                        fontSize: 14,
                      ),
                    ),

                    // Row(
                    //   children: [
                    //     fiksi,
                    //     SizedBox(
                    //       width: 4,
                    //     ),
                    //     petualangan,
                    //     SizedBox(
                    //       width: 4,
                    //     ),
                    //     thriller,
                    //   ],
                    // )
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Wrap(
                        runSpacing: 5,
                        spacing: 2,
                        children: [],
                      ),
                    )

                    // Expanded(
                    //   child: Container(
                    //     height: 300,
                    //     child: ListView.builder(
                    //       physics: NeverScrollableScrollPhysics(),
                    //       shrinkWrap: true,
                    //       itemCount: genre.length,
                    //       itemBuilder: (context, index) {
                    //         return genre[index];
                    //       },
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.favorite,
                  size: 20,
                  // color: widget.favorite ? blueColor : whiteColor,
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
