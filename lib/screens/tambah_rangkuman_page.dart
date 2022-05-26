import 'package:flutter/material.dart';
import 'package:mobprog_perpusku/database/model.dart';
import 'package:mobprog_perpusku/screens/route_page.dart';
import 'package:mobprog_perpusku/theme.dart';
import 'package:mobprog_perpusku/widget/genre_widget.dart';
import 'package:flutter/gestures.dart';

import '../database/db_rangkuman.dart';

class TambahRangkuman extends StatefulWidget {
  final Rangkuman? rangkuman;
  const TambahRangkuman({Key? key, this.rangkuman}) : super(key: key);

  @override
  State<TambahRangkuman> createState() => _TambahRangkumanState();
}

class _TambahRangkumanState extends State<TambahRangkuman> {
  final TextEditingController _judulController =
      TextEditingController(text: '');
  final TextEditingController _penulisController =
      TextEditingController(text: '');
  final TextEditingController _rangkumanController =
      TextEditingController(text: '');

  late bool isFavorite;
  late bool isHorror;
  late bool isPetualangan;
  late bool isPengembanganDiri;
  late bool isKomedi;
  late bool isRomansa;
  late bool isFiksi;
  late bool isThriller;
  late bool isMisteri;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.rangkuman?.favorit ?? false;
    _judulController.text = widget.rangkuman?.judul ?? '';
    _penulisController.text = widget.rangkuman?.penulis ?? '';
    _penulisController.text = widget.rangkuman?.penulis ?? '';

    isHorror = widget.rangkuman?.horror ?? false;
    isPetualangan = widget.rangkuman?.petualangan ?? false;
    isPengembanganDiri = widget.rangkuman?.pengembanganDiri ?? false;
    isKomedi = widget.rangkuman?.komedi ?? false;
    isRomansa = widget.rangkuman?.romansa ?? false;
    isFiksi = widget.rangkuman?.fiksi ?? false;
    isThriller = widget.rangkuman?.thriller ?? false;
    isMisteri = widget.rangkuman?.misteri ?? false;
  }

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
                // onChanged: (_) {},
                controller: _judulController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _penulisController,
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
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => showDialog(
                  // barrierDismissible: false,
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
                          onChecked: (value) {
                            isHorror = value;
                          },
                        ),
                        GenreSelector(
                          genre: petualangan,
                          checkValue: isPetualangan,
                          onChecked: (value) {
                            isPetualangan = value;
                          },
                        ),
                        GenreSelector(
                          genre: pengembanganDiri,
                          checkValue: isPengembanganDiri,
                          onChecked: (value) {
                            isPengembanganDiri = value;
                          },
                        ),
                        GenreSelector(
                          genre: komedi,
                          checkValue: isKomedi,
                          onChecked: (value) {
                            isKomedi = value;
                          },
                        ),
                        GenreSelector(
                          genre: romansa,
                          checkValue: isRomansa,
                          onChecked: (value) {
                            isRomansa = value;
                          },
                        ),
                        GenreSelector(
                          genre: fiksi,
                          checkValue: isFiksi,
                          onChecked: (value) {
                            isFiksi = value;
                          },
                        ),
                        GenreSelector(
                          genre: thriller,
                          checkValue: isThriller,
                          onChecked: (value) {
                            isThriller = value;
                          },
                        ),
                        GenreSelector(
                          genre: misteri,
                          checkValue: isMisteri,
                          onChecked: (value) {
                            isMisteri = value;
                          },
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: ElevatedButton(
                        //     style: ButtonStyle(
                        //       backgroundColor:
                        //           MaterialStateProperty.all(blackColor),
                        //       elevation: MaterialStateProperty.all(0),
                        //       shape: MaterialStateProperty.all(
                        //         RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(17),
                        //         ),
                        //       ),
                        //     ),
                        //     onPressed: () {},
                        //     child: Container(
                        //       padding: EdgeInsets.symmetric(
                        //         vertical: 6,
                        //       ),
                        //       child: Text(
                        //         "Simpan",
                        //         style: semiWhiteBoldTextStyle.copyWith(
                        //             fontSize: 20),
                        //       ),
                        //     ),
                        //   ),
                        // )
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
              SizedBox(
                // height: 300,
                child: TextFormField(
                  controller: _rangkumanController,
                  maxLines: null,
                  style: TextStyle(
                    color: greyColor,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    hintText: "Rangkuman",
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
                  // onChanged: (_) {},
                ),
              ),
              SizedBox(
                height: 190,
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
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Simpan Rangkuman?"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: blackColor,
                        width: 3,
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: ListBody(children: [
                        Text(
                          "Pastikan data yang anda ingin simpan telah terisi dan benar.",
                          style: regularBlackTextSTyle.copyWith(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                    ),
                    actions: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(blackColor),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                          onPressed: () => statusTambahRangkuman(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              "Simpan",
                              style: semiWhiteBoldTextStyle.copyWith(
                                fontSize: 24,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    "Simpan",
                    style: semiWhiteBoldTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future statusTambahRangkuman() async {
    final isUpdate = widget.rangkuman != null;

    if (isUpdate) {
      await updateNote();
    } else {
      await createNote();
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RoutePage()));
  }

  Future updateNote() async {
    final rangkuman = widget.rangkuman!.copy(
        favorit: isFavorite,
        judul: _judulController.text,
        penulis: _penulisController.text,
        deskripsi: _rangkumanController.text,
        horror: isHorror,
        petualangan: isPetualangan,
        pengembanganDiri: isPengembanganDiri,
        komedi: isKomedi,
        romansa: isRomansa,
        fiksi: isFiksi,
        thriller: isThriller,
        misteri: isMisteri,
        mediaPath: "" // masih tahap pengerjaan
        );

    await RangkumanDatabase.instance.updateRangkuman(rangkuman);
  }

  Future createNote() async {
    final rangkuman = Rangkuman(
      favorit: isFavorite,
      judul: _judulController.text,
      penulis: _penulisController.text,
      deskripsi: _rangkumanController.text,
      horror: isHorror,
      petualangan: isPetualangan,
      pengembanganDiri: isPengembanganDiri,
      komedi: isKomedi,
      romansa: isRomansa,
      fiksi: isFiksi,
      thriller: isThriller,
      misteri: isMisteri,
      mediaPath: "",
    );

    await RangkumanDatabase.instance.createRangkuman(rangkuman);
  }
}

class RoundedeRectangleBorder {}

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
