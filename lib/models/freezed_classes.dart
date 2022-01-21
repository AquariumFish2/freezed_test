import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'freezed_classes.freezed.dart';
part 'freezed_classes.g.dart';

@freezed
abstract class Post with _$Post {
  const factory Post(int id, String title) = _Post;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
abstract class Comment with _$Comment {
  const factory Comment(int id, String body,int postId) = _Comment;
  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}
