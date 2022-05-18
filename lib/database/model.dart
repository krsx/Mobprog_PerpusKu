class Rangkuman {
  static final List<String> values = [
    colId,
    colFavorit,
    colJudul,
    colDeskripsi,
    colPenulis,
    colMediaPath,
    colHorror,
    colPetualangan,
    colPengembanganDiri,
    colKomedi,
    colRomansa,
    colFiksi,
    colThriller,
    colMisteri,
  ];

  static String tblRangkuman = 'rangkuman';
  static final String colId = '_id';
  static final String colFavorit = 'favorit';
  static final String colJudul = 'judul';
  static final String colDeskripsi = 'deskripsi';
  static final String colPenulis = 'penulis';
  static final String colMediaPath = 'media_path';
  static final String colHorror = 'horror';
  static final String colPetualangan = 'petualangan';
  static final String colPengembanganDiri = 'pengembangan_diri';
  static final String colKomedi = 'komedi';
  static final String colRomansa = 'romansa';
  static final String colFiksi = 'fiksi';
  static final String colThriller = 'thriller';
  static final String colMisteri = 'misteri';

  final int? id;
  final bool favorit;
  final String penulis;
  final String judul;
  final String deskripsi;
  final String mediaPath;
  final bool horror;
  final bool petualangan;
  final bool pengembanganDiri;
  final bool komedi;
  final bool romansa;
  final bool fiksi;
  final bool thriller;
  final bool misteri;

  const Rangkuman({
    this.id,
    required this.penulis,
    required this.favorit,
    required this.deskripsi,
    this.mediaPath = '',
    required this.judul,
    this.horror = false,
    this.petualangan = false,
    this.pengembanganDiri = false,
    this.komedi = false,
    this.romansa = false,
    this.fiksi = false,
    this.thriller = false,
    this.misteri = false,
  });

  Rangkuman copy({
    int? id,
    bool? favorit,
    String? penulis,
    String? judul,
    String? deskripsi,
    String? mediaPath,
    bool? horror,
    bool? petualangan,
    bool? pengembanganDiri,
    bool? komedi,
    bool? romansa,
    bool? fiksi,
    bool? thriller,
    bool? misteri,
  }) =>
      Rangkuman(
        id: id ?? this.id,
        favorit: favorit ?? this.favorit,
        penulis: penulis ?? this.penulis,
        deskripsi: deskripsi ?? this.deskripsi,
        mediaPath: mediaPath ?? this.mediaPath,
        judul: judul ?? this.judul,
        horror: horror ?? this.horror,
        petualangan: petualangan ?? this.petualangan,
        pengembanganDiri: pengembanganDiri ?? this.pengembanganDiri,
        komedi: komedi ?? this.komedi,
        romansa: romansa ?? this.romansa,
        fiksi: fiksi ?? this.fiksi,
        thriller: thriller ?? this.thriller,
        misteri: misteri ?? this.misteri,
      );

  static Rangkuman fromJson(Map<String, Object?> json) => Rangkuman(
        id: json[colId] as int?,
        favorit: json[colFavorit] == 1,
        penulis: json[colPenulis] as String,
        deskripsi: json[colDeskripsi] as String,
        mediaPath: json[colMediaPath] as String,
        judul: json[colJudul] as String,
        horror: json[colHorror] == 1,
        petualangan: json[colPetualangan] == 1,
        pengembanganDiri: json[colPengembanganDiri] == 1,
        komedi: json[colKomedi] == 1,
        romansa: json[colRomansa] == 1,
        fiksi: json[colFiksi] == 1,
        thriller: json[colThriller] == 1,
        misteri: json[colMisteri] == 1,
      );

  Map<String, Object?> toJson() => {
        colId: id,
        colFavorit: favorit ? 1 : 0,
        colPenulis: penulis,
        colJudul: judul,
        colDeskripsi: deskripsi,
        colMediaPath: mediaPath,
        colHorror: horror ? 1 : 0, // konversi nilai boolean ke nilai 0 atau 1
        colPetualangan: petualangan ? 1 : 0,
        colPengembanganDiri: pengembanganDiri ? 1 : 0,
        colKomedi: komedi ? 1 : 0,
        colRomansa: romansa ? 1 : 0,
        colFiksi: fiksi ? 1 : 0,
        colThriller: thriller ? 1 : 0,
        colMisteri: misteri ? 1 : 0,
      };
}
