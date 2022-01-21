import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_test/helpers/database_paths.dart';
import 'package:freezed_test/models/freezed_classes.dart';
import 'package:http/http.dart' as http;

class Messeges extends ChangeNotifier {
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  addmessege(int id, String title) {
    _posts.add(Post(id, title));
    notifyListeners();
  }

  getMessegesFromDB(BuildContext context) async {
    final messegesAsJson = await http.get(DatabasePath).catchError(
          (e) =>
              // ignore: invalid_return_type_for_catch_error
              ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e),
            ),
          ),
        );
    _posts = [];
    notifyListeners();
    final result = json.decode(messegesAsJson.body);
    if (result.length > 0) {
      result.forEach(
        (e) {
          _posts.add(Post.fromJson(e));
        },
      );
    }
  }
}
