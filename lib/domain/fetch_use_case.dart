import 'package:fluttertest/domain/repository.dart';
import 'package:fluttertest/domain/result_fds.dart';

class FetchUseCase {
  final Repository repository;

  FetchUseCase({required this.repository});

  Future<ResultFDS<dynamic>> fetchData() async => repository.fetchData();
}