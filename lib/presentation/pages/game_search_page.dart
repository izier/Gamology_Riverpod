import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/common/constants.dart';
import 'package:gamology_riverpod/presentation/provider/search_game_notifier.dart';
import 'package:gamology_riverpod/presentation/widgets/game_card.dart';

class GameSearchPage extends ConsumerWidget{
  GameSearchPage({super.key});

  String searchQuery = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Search'),
        elevation: 0,
        backgroundColor: DarkTheme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                print('start scenario 2');
                searchQuery = query;
                ref.watch(gameSearchProvider(searchQuery));
              },
              decoration: const InputDecoration(
                hintText: 'Search game',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.white,
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(
              height: 8,
            ),
            searchQuery == '' ? const Center(child: Text('Search for game')) :
            ref.watch(gameSearchProvider(searchQuery)).when(
              data: (games) => Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return GameCard(game);
                  },
                  itemCount: games.length,
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Text(stackTrace.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}