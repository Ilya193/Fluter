import 'package:fluttertest/domain/result_fds.dart';

abstract class Repository {
  Future<ResultFDS<dynamic>> fetchData();
}

