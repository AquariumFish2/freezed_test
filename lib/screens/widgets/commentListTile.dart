import 'package:flutter/material.dart';
import 'package:freezed_test/models/freezed_classes.dart';

class CommentListTile extends StatelessWidget {
  const CommentListTile({Key? key, required this.comment}) : super(key: key);
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text('${comment.id}'),
            const Spacer(),
            Text(comment.body),
          ],
        ),
      ),
    );
  }
}
