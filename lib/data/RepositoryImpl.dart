import 'dart:convert';

import 'package:fluttertest/data/service.dart';
import 'package:fluttertest/domain/repository.dart';

import '../domain/Album.dart';
import '../domain/result_fds.dart';

class RepositoryImpl extends Repository {
  final Service service;

  RepositoryImpl({required this.service});

  @override
  Future<ResultFDS<dynamic>> fetchData() async {
    try {
      final response = await service.fetch();
      final List data = jsonDecode(response.body);
      return SuccessAlbum(data: data.map((e) => Album.fromJson(e)).toList());
    } catch (_) {
      return Error();
    }
  }
}