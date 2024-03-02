import 'Album.dart';

abstract class ResultFDS<T> {}

class SuccessAlbum extends ResultFDS<List<Album>> {
  final List<Album> data;

  SuccessAlbum({required this.data});
}

class Error extends ResultFDS<Exception> {
  Error();
}