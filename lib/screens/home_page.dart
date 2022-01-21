import 'package:flutter/material.dart';
import 'package:freezed_test/providers/posts.dart';
import 'package:freezed_test/screens/widgets/postTile.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final messegesProvider = Provider.of<Posts>(context, listen: false);
    final posts = Provider.of<Posts>(context).posts;
    final comments = Provider.of<Posts>(context).comments;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
        future: messegesProvider.getPostsFromDB(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: posts.length,
            itemBuilder: (context, index) =>
                PostWidgetTile(post: posts[index], comments: comments),
          );
        },
      ),
    );
  }
}
