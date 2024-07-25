import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uyishi_84/blocs/puzzle_bloc.dart';
import 'package:uyishi_84/blocs/puzzle_event.dart';
import 'package:uyishi_84/blocs/puzzle_state.dart';
import 'package:uyishi_84/views/widgets/puzzle_tile.dart';

class PuzzleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 36, 31),
        title: Text(
          'Puzzle',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[200],
              fontSize: 40),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<PuzzleBloc, PuzzleState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fon.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: 16,
                      itemBuilder: (context, index) {
                        final tile = state.tiles[index];
                        return PuzzleTile(
                          tile: tile,
                          onTap: () {
                            // Plitka bosilganda, TileMoved hodisasi yuboriladi
                            context
                                .read<PuzzleBloc>()
                                .add(TileMoved(tileIndex: index));
                          },
                        );
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<PuzzleBloc>().add(LoadPuzzle());
                  },
                  child: Icon(
                    Icons.refresh,
                    color: Colors.red,
                    size: 60,
                  ),
                ),
                SizedBox(
                  height: 150,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
