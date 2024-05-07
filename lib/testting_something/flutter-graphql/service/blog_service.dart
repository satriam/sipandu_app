import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink(
    "https://api-ap-southeast-2.hygraph.com/v2/clnym21zt912p01t94qas5p0v/master");

final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
  GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  ),
);

const String query = """
query Content{
  posts{
    id
    title
    excerpt
    coverImage {
      url
    }
  }
}
""";

// . . .
const String updatePostMutation = """
mutation {
  updatePost(
    where: { id: "ckadrcx4g00pw01525c5d2e56" }
    data: { author: "Elijah Asaolu" }
  ) {
    id
    name
    price
  }
}
""";
