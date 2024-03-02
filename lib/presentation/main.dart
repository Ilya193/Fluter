import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/data/RepositoryImpl.dart';
import 'package:fluttertest/data/service.dart';
import 'package:fluttertest/domain/fetch_use_case.dart';
import 'package:fluttertest/presentation/bloc/start_screen_cubit.dart';
import 'package:fluttertest/presentation/bloc/start_screen_state.dart';
import 'package:fluttertest/presentation/widgets/albums_list.dart';
import 'package:fluttertest/presentation/widgets/empty_widget.dart';
import 'package:fluttertest/presentation/widgets/failure_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StartScreenCubit cubit = StartScreenCubit(
      useCase: FetchUseCase(repository: RepositoryImpl(service: Service())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: BlocBuilder<StartScreenCubit, StartScreenState>(
        bloc: cubit,
        builder: (BuildContext context, StartScreenState state) {
          if (state is InitialState) {
            return const EmptyWidget();
          } else if (state is SuccessState) {
            return AlbumsList(albums: state.list);
          } else if (state is LoadingState) {
            return const CircularProgressIndicator();
          } else {
            return const FailureWidget();
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit.fetch();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
