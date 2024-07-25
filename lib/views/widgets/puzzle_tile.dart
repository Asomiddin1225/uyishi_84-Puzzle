import 'package:flutter/material.dart';
import 'package:uyishi_84/models/tile.dart';

class PuzzleTile extends StatelessWidget {
  final Tile tile;
  final VoidCallback onTap;

  // PuzzleTile konstruktori - plitka va bosish funksiyasini qabul qiladi.
  const PuzzleTile({required this.tile, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Agar plitka bo'sh bo'lsa, onTap funksiyasini chaqirmaydi
      onTap: tile.isEmpty ? null : onTap,
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: tile.isEmpty ? Colors.grey[200] : Colors.grey[500],
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
          // Plitkaning raqamini ko'rsatadi, agar bo'sh bo'lsa, hech narsa ko'rsatmaydi
          child: Text(
            tile.isEmpty ? '' : '${tile.number}',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
