class BookCollection {
  BookCollection({
    required this.kind,
    required this.totalItems,
    required this.items,
    this.pageCount,
  });

  String kind;
  int totalItems;
  List<Item> items;
  int? pageCount;

  factory BookCollection.fromJson(Map<String, dynamic> json) => BookCollection(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pageCount: json["pageCount"],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "pageCount": pageCount,
      };
}

class Item {
  Item({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
  });

  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo.toJson(),
      };
}

class VolumeInfo {
  VolumeInfo({
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.imageLinks,
    this.description,
    required this.previewLink,
  });

  String title;
  List<String> authors;
  String publisher;
  ImageLinks imageLinks;
  String publishedDate;
  String previewLink;
  String? description;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        authors: List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"],
        publishedDate: json["publishedDate"],
        imageLinks: ImageLinks.fromJson(json["imageLinks"]),
        description: json["description"],
        previewLink: json["previewLink"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "publisher": publisher,
        "publishedDate": publishedDate,
        "description": description,
        "previewLink": previewLink,
      };
}

class ImageLinks {
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  String smallThumbnail;
  String thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}
