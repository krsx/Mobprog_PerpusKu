import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/screens/rangkuman_page.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/genre_widget.dart';

class RangkumanCard extends StatefulWidget {
  // final String judul;
  // final String penulis;
  // final bool isFavorite;
  // final List<Widget> genre;

  final int id;
  final String judul;
  final String penulis;
  final String mediaPath;
  final bool favorite;

  final bool horror;
  final bool petualangan;
  final bool pengembanganDiri;
  final bool komedi;
  final bool romansa;
  final bool fiksi;
  final bool thriller;
  final bool misteri;

  const RangkumanCard(
      {Key? key,
      required this.id,
      required this.favorite,
      required this.judul,
      required this.penulis,
      required this.mediaPath,
      required this.horror,
      required this.petualangan,
      required this.pengembanganDiri,
      required this.komedi,
      required this.romansa,
      required this.fiksi,
      required this.thriller,
      required this.misteri})
      : super(key: key);

  @override
  State<RangkumanCard> createState() => _RangkumanCardState();
}

class _RangkumanCardState extends State<RangkumanCard> {
  List<Widget> genre = [];

  void isiGenre() {
    genre.clear();
    genre.add(SizedBox());
    if (widget.horror) genre.add(horror);
    if (widget.petualangan) genre.add(petualangan);
    if (widget.pengembanganDiri) genre.add(pengembanganDiri);
    if (widget.komedi) genre.add(komedi);
    if (widget.romansa) genre.add(romansa);
    if (widget.fiksi) genre.add(fiksi);
    if (widget.thriller) genre.add(thriller);
    if (widget.misteri) genre.add(misteri);
  }

  @override
  Widget build(BuildContext context) {
    isiGenre();

    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RangkumanPage()));
      },
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Spacer(),
                      Icon(
                        Icons.favorite,
                        size: 20,
                        color: widget.favorite ? blueColor : whiteColor,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.judul,
                        style: mediumBlackTextSTyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      // SizedBox(
                      //   height: 2,
                      // ),
                      Text(
                        widget.penulis,
                        style: lightTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 2,
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
                      // ConstrainedBox(
                      //   constraints: BoxConstraints(maxWidth: 220),
                      //   child: ListView.builder(itemBuilder: (context, index) {
                      //     return Wrap(
                      //       spacing: 5,
                      //       runSpacing: 5,
                      //       children: [genre[index]],
                      //     );
                      //   }),
                      // )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
