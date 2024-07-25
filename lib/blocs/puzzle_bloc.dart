import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uyishi_84/blocs/puzzle_event.dart';
import 'package:uyishi_84/blocs/puzzle_state.dart';
import 'package:uyishi_84/models/tile.dart';
import 'package:uyishi_84/repositories/puzzle_repository.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  final PuzzleRepository repository;

  // PuzzleBloc konstruktori - PuzzleRepository ob'ektini qabul qiladi
  // va dastlabki holatni PuzzleState(tiles: []) ga o'rnatadi.
  PuzzleBloc({required this.repository}) : super(PuzzleState(tiles: [])) {
    // LoadPuzzle va TileMoved hodisalarini qayta ishlash funksiyalarini belgilaydi.
    on<LoadPuzzle>(_onLoadPuzzle);
    on<TileMoved>(_onTileMoved);
  }

  // _onLoadPuzzle funksiyasi - LoadPuzzle hodisasi kelib tushganda,
  // plitkalarni yaratib, yangi holatni emit qiladi.
  void _onLoadPuzzle(LoadPuzzle event, Emitter<PuzzleState> emit) {
    final tiles = repository.generateTiles();
    emit(PuzzleState(tiles: tiles));
  }

  // _onTileMoved funksiyasi - TileMoved hodisasi kelib tushganda,
  // plitkalarni almashtiradi va yangi holatni emit qiladi.
  void _onTileMoved(TileMoved event, Emitter<PuzzleState> emit) {
    final tiles = List<Tile>.from(state.tiles);
    final emptyIndex = tiles.indexWhere((tile) => tile.isEmpty);
    final clickedTile = tiles[event.tileIndex];

    // Agar bosilgan plitka va bo'sh plitka orasidagi masofa 1 yoki 4 bo'lsa,
    // ularni almashtiradi.
    if ((emptyIndex - event.tileIndex).abs() == 1 ||
        (emptyIndex - event.tileIndex).abs() == 4) {
      tiles[emptyIndex] = Tile(number: clickedTile.number, isEmpty: false);
      tiles[event.tileIndex] = Tile(number: 16, isEmpty: true);
      emit(PuzzleState(tiles: tiles));
    }
  }
}
