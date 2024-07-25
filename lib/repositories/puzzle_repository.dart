import 'dart:math';

import 'package:uyishi_84/models/tile.dart';

class PuzzleRepository {
  // generateTiles funksiyasi 15 ta raqamli plitkalarni yaratadi
  // va 1 ta bo'sh plitka qo'shib, ularni tasodifiy tartibda joylashtiradi.
  List<Tile> generateTiles() {
    List<Tile> tiles = List.generate(15, (index) => Tile(number: index + 1));
    tiles.add(Tile(number: 16, isEmpty: true));
    tiles.shuffle(Random());
    return tiles;
  }

  // isSolved funksiyasi berilgan plitkalar ro'yxati 1 dan 15 gacha
  // to'g'ri tartibda joylashtirilganligini tekshiradi.
  bool isSolved(List<Tile> tiles) {
    for (int i = 0; i < 15; i++) {
      if (tiles[i].number != i + 1) {
        return false;
      }
    }
    return true;
  }
}
