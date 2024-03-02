import 'package:fluttertest/domain/Album.dart';

abstract class StartScreenState {}

class InitialState extends StartScreenState {
  InitialState();
}

class SuccessState extends StartScreenState {
  final List<Album> list;

  SuccessState({required this.list});
}

class LoadingState extends StartScreenState {}
class ErrorState extends StartScreenState {}