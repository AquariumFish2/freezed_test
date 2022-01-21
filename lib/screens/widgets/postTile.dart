import 'package:flutter/material.dart';
import 'package:freezed_test/models/freezed_classes.dart';
import 'package:freezed_test/screens/widgets/commentListTile.dart';

class PostWidgetTile extends StatefulWidget {
  PostWidgetTile({Key? key, required this.post, required this.comments})
      : super(key: key);
  final Post post;
  final List<Comment> comments;

  @override
  State<PostWidgetTile> createState() => _PostWidgetTileState();
}

class _PostWidgetTileState extends State<PostWidgetTile> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '${widget.post.id}',
                  style: const TextStyle(color: Colors.blue, fontSize: 18),
                ),
                const Spacer(),
                Text(widget.post.title),

                // ListView.builder(
                //   shrinkWrap: true,
                //   itemBuilder: (ctx, index) {
                //     if (widget.comments[index].postId == widget.post.id) {
                //       i++;
                //       return CommentListTile(
                //         comment: widget.comments[index],
                //       );
                //     }
                //     return Container();
                //   },
                //   itemCount: i,
                // ),
              ],
            ),
            ...widget.comments.map(
              (e) {
                print('jj');
                if (e.postId == widget.post.id) {
                  return CommentListTile(
                    comment: e,
                  );
                }
                return Container();
              },
            ).toList()
          ],
        ),
      ),
    );
  }
}
