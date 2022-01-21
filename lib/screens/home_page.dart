import 'package:flutter/material.dart';
import 'package:freezed_test/providers/messeges.dart';
import 'package:freezed_test/screens/widgets/posts.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final messegesProvider = Provider.of<Messeges>(context, listen: false);
    final posts = Provider.of<Messeges>(context, listen: true).posts;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
        future: messegesProvider.getMessegesFromDB(context),
        builder: (context, snapshot) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: posts.length,
            itemBuilder: (context, index) =>
                PostWidgetTile(post: posts[index]),
          );
        },
      ),
    );
  }
}
