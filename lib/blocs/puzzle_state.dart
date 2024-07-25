import 'package:uyishi_84/models/tile.dart';

class PuzzleState {
  final List<Tile> tiles;

  // PuzzleState konstruktori - o'yinning joriy holatini saqlaydi,
  // bu yerda tiles - plitkalar ro'yxatini ifodalaydi.
  PuzzleState({required this.tiles});

  @override
  List<Object> get props => [tiles];
}
