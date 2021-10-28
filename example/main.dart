import 'package:faunadb_http/faunadb_http.dart';
import 'package:faunadb_http/query.dart';

/*
* FaunaDB secret should be the first argument
* `dart ./main.dart <your_secret_here>`
* */
void main(List<String> arguments) async {
  final config = FaunaConfig.build(
    secret: arguments[0],
  );
  // Or if you want to put your secret straight in your code
  // final config = FaunaDBConfig.build(secret: '<your_secret_here>');
  final client = FaunaClient(config);

  final query =
      Identify(Ref(Collection("users"), "284854841250939405"), "test");
  print('query=>\n$query');

  final response = await client.query(query);
  if (response.hasErrors) {
    print('error=>\n${response.errors}');
  } else {
    print('response=>\n${response.resource}');
  }

  client.close();
}
