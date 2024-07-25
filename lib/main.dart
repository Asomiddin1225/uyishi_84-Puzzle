import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uyishi_84/blocs/puzzle_bloc.dart';
import 'package:uyishi_84/blocs/puzzle_event.dart';
import 'package:uyishi_84/repositories/puzzle_repository.dart';
import 'package:uyishi_84/views/screen/puzzle_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) =>
            PuzzleBloc(repository: PuzzleRepository())..add(LoadPuzzle()),
        child: PuzzleScreen(),
      ),
    );
  }
}
