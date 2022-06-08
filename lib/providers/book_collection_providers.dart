import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:mobprog_perpusku/database/models/book_collection.dart';
import 'package:http/http.dart' as http;

class BookCollectionProvider extends ChangeNotifier {
  BookCollection? _bookCol;
  bool loading = false;
  BookCollection? get bookCol => _bookCol;

  Future<BookCollection?> fetchBookCollection({String search = ''}) async {
    final res = await http.get(
        Uri.parse("https://www.googleapis.com/books/v1/volumes?q=''"));

    if (res.statusCode == 200) {
      return BookCollection.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load Book Collection');
    }
  }

  void getBookCollection({String search = ''}) async {
    loading = true;
    _bookCol = (await fetchBookCollection())!;
    loading = false;

    notifyListeners();
  }
}
