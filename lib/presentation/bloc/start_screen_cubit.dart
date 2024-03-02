import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/domain/fetch_use_case.dart';
import 'package:fluttertest/presentation/bloc/start_screen_state.dart';

import '../../domain/result_fds.dart';

class StartScreenCubit extends Cubit<StartScreenState> {
  final FetchUseCase useCase;
  StartScreenCubit({required this.useCase}) : super(InitialState());

  void fetch() async {
    emit(LoadingState());
    final response = await useCase.fetchData();
    if (response is SuccessAlbum) {
      emit(SuccessState(list: response.data));
    } else {
      emit(ErrorState());
    }
  }
}