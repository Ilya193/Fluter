import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Service {
  Service();

  Future<Response> fetch() async =>
      http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
}
