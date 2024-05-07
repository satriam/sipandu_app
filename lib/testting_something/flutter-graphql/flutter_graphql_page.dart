import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hyper_ui/testting_something/flutter-graphql/blog_page.dart';
import 'package:hyper_ui/testting_something/flutter-graphql/service/blog_service.dart';

class FlutterGraphqlPage extends StatelessWidget {
  const FlutterGraphqlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hygraph Blog",
        ),
        actions: [
          Mutation(
            options: MutationOptions(document: gql(updatePostMutation)),
            builder: (runMutation, result) {
              return IconButton(
                  onPressed: () {
                    final result = runMutation({});
                    print("Result : $result");
                  },
                  icon: Icon(Icons.add));
            },
          )
        ],
      ),
      body: Query(
        options: QueryOptions(
            document: gql(query),
            variables: const <String, dynamic>{"variableName": "value"}),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (result.data == null) {
            return const Center(
              child: Text("No article found!"),
            );
          }
          final posts = result.data!['posts'];
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              itemBuilder:
              (context, index) {
                final post = posts[index];
                final title = post['title'];
                final excerpt = post['excerpt'];
                final coverImageURL = post!['coverImage']['url'];
                return BlogRow(
                  title: title,
                  excerpt: excerpt,
                  coverURL: coverImageURL,
                );
              };
            },
          );
        },
      ),
    );
  }
}
