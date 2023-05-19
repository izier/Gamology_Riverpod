import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/common/constants.dart';
import 'package:gamology_riverpod/presentation/provider/new_released_game_list_notifier.dart';
import 'package:gamology_riverpod/presentation/provider/popular_game_list_notifier.dart';
import 'package:gamology_riverpod/presentation/provider/top_rated_game_list_notifier.dart';
import 'package:gamology_riverpod/presentation/widgets/home_game_card.dart';

class HomePage extends ConsumerWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularGameList = ref.read(getPopularGameListProvider(1));
    final topRatedGameList = ref.read(getTopRatedListProvider(1));
    final newReleasedGameList = ref.read(getNewReleasedGameListProvider(1));
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text('Popular Games', style: DarkTheme.headline2),
            const SizedBox(height: 8),
            popularGameList.when(
              data: (games) => SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return HomeGameCard(game);
                  },
                  itemCount: 15,
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Text(stackTrace.toString()),
              ),
            ),
            const Text('Top Rated Games', style: DarkTheme.headline2),
            const SizedBox(height: 8),
            topRatedGameList.when(
              data: (games) => SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return HomeGameCard(game);
                  },
                  itemCount: 15,
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Text(stackTrace.toString()),
              ),
            ),
            const Text('New Released Games', style: DarkTheme.headline2),
            const SizedBox(height: 8),
            newReleasedGameList.when(
              data: (games) => SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return HomeGameCard(game);
                  },
                  itemCount: 15,
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
        )
      ),
    );
  }
}