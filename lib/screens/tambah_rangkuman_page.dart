import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/genre_widget.dart';
import 'package:flutter/gestures.dart';

class TambahRangkuman extends StatefulWidget {
  const TambahRangkuman({Key? key}) : super(key: key);

  @override
  State<TambahRangkuman> createState() => _TambahRangkumanState();
}

class _TambahRangkumanState extends State<TambahRangkuman> {
  bool isFavorite = false;

  bool isHorror = false;
  bool isPetualangan = false;
  bool isPengembanganDiri = false;
  bool isKomedi = false;
  bool isRomansa = false;
  bool isFiksi = false;
  bool isThriller = false;
  bool isMisteri = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: blueColor,
                      size: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(
                  color: greyColor,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  fillColor: greyColor,
                  focusColor: greyColor,
                  hintText: "Judul",
                  hintStyle: lightTextStyle,
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
                onChanged: (_) {},
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(
                  color: greyColor,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  fillColor: greyColor,
                  focusColor: greyColor,
                  hintText: "Penulis",
                  hintStyle: lightTextStyle,
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
                onChanged: (_) {},
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: blackColor,
                        width: 3,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenreSelector(
                          genre: horror,
                          checkValue: isHorror,
                          onChecked: (_) {},
                        ),
                        GenreSelector(
                          genre: petualangan,
                          checkValue: isPetualangan,
                          onChecked: (_) {},
                        ),
                        GenreSelector(
                          genre: pengembanganDiri,
                          checkValue: isPengembanganDiri,
                          onChecked: (_) {},
                        ),
                        GenreSelector(
                          genre: komedi,
                          checkValue: isKomedi,
                          onChecked: (_) {},
                        ),
                        GenreSelector(
                          genre: romansa,
                          checkValue: isRomansa,
                          onChecked: (_) {},
                        ),
                        GenreSelector(
                          genre: fiksi,
                          checkValue: isFiksi,
                          onChecked: (_) {},
                        ),
                        GenreSelector(
                          genre: thriller,
                          checkValue: isThriller,
                          onChecked: (_) {},
                        ),
                        GenreSelector(
                          genre: misteri,
                          checkValue: isMisteri,
                          onChecked: (_) {},
                        ),
                      ],
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Genre",
                        style: lightTextStyle,
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_drop_down,
                        color: greyColor,
                      ),
                    ],
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(whiteColor),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: blackColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Gambar",
                        style: lightTextStyle,
                      ),
                      Spacer(),
                      Icon(
                        Icons.camera_alt_rounded,
                        color: greyColor,
                      ),
                    ],
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(whiteColor),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: blackColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: null,
                style: TextStyle(
                  color: greyColor,
                ),
                decoration: InputDecoration(
                  fillColor: greyColor,
                  focusColor: greyColor,
                  hintStyle: lightTextStyle.copyWith(),
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
                onChanged: (_) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenreSelector extends StatefulWidget {
  const GenreSelector({
    Key? key,
    required this.genre,
    required this.checkValue,
    required this.onChecked,
  }) : super(key: key);

  final Widget genre;
  final Function(bool) onChecked;
  final bool checkValue;

  @override
  State<GenreSelector> createState() => _GenreSelectorState();
}

class _GenreSelectorState extends State<GenreSelector> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.checkValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.genre,
        Checkbox(
          side: BorderSide(
            color: blackColor,
            width: 2,
          ),
          activeColor: blackColor,
          shape: const CircleBorder(),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChecked(isChecked);
            });
          },
        ),
      ],
    );
  }
}
