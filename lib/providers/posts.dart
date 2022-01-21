import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_test/helpers/database_paths.dart';
import 'package:freezed_test/models/freezed_classes.dart';
import 'package:http/http.dart' as http;

class Posts extends ChangeNotifier {
  List<Post> _posts = [];
  List<Post> get posts => _posts;
  addPost(int id, String title, List<Comment> comments) {
    _posts.add(
      Post(id, title),
    );
  }

  List<Comment> _comments = [];
  List<Comment> get comments => _comments;
  addComment(int id, String title, int postId) {
    _comments.add(Comment(id, title, postId));
  }

  late final fullPostsAsJson;
  getPostsFromDB(BuildContext context) async {
    _posts = [];
    _comments = [];
    final postsAsJson = await http.get(postsDatabasePath).catchError(
          (e) =>
              // ignore: invalid_return_type_for_catch_error
              ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e),
            ),
          ),
        );
    fullPostsAsJson = json.decode(postsAsJson.body);
    fetchData();
    //print(commentsResult);
  }

  fetchData() {
    if (fullPostsAsJson['posts'].length > 0) {
      fullPostsAsJson['posts'].forEach(
        (e) {
          _posts.add(
            Post.fromJson(e),
          );
        },
      );
    }
    print(posts);

    if (fullPostsAsJson['comments'].length > 0) {
      fullPostsAsJson['comments'].forEach(
        (e) {
          print(e);
          _comments.add(
            Comment.fromJson(e),
          );
        },
      );
    }
    notifyListeners();
  }
}
