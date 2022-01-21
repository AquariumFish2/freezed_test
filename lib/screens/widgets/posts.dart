import 'package:flutter/material.dart';
import 'package:freezed_test/models/freezed_classes.dart';

class PostWidgetTile extends StatelessWidget {
  const PostWidgetTile({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '${post.id}',
            style: const TextStyle(color: Colors.blue, fontSize: 18),
          ),
          const Spacer(),
          Text(post.title),
        ],
      ),
    );
  }
}
