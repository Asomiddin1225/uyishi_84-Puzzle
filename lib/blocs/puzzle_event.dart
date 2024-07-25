abstract class PuzzleEvent {
  @override
  List<Object> get props => [];
}

// LoadPuzzle hodisasi - o'yinni qayta yuklash yoki boshlash hodisasi.
class LoadPuzzle extends PuzzleEvent {}

// TileMoved hodisasi - plitkani ko'chirish hodisasi,
// bu yerda tileIndex - bosilgan plitkaning indeksini belgilaydi.
class TileMoved extends PuzzleEvent {
  final int tileIndex;

  TileMoved({required this.tileIndex});

  @override
  List<Object> get props => [tileIndex];
}
