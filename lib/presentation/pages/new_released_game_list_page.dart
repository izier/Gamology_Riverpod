import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/common/constants.dart';
import 'package:gamology_riverpod/presentation/provider/new_released_game_list_notifier.dart';
import 'package:gamology_riverpod/presentation/widgets/game_card.dart';

class NewReleasedGameListPage extends ConsumerWidget {
  NewReleasedGameListPage({super.key});

  int page = 1;
  bool isFirstPage = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newReleasedList = ref.watch(getNewReleasedGameListProvider(page));

    return Padding(
      padding: const EdgeInsets.only(top: 16,left: 8, right: 8),
      child: Column(
        children: [
          const Text('Popular Games', style: DarkTheme.headline1),
          const SizedBox(height: 8),
          const Text('Based on ratings and popularity'),
          const SizedBox(height: 8),
          newReleasedList.when(
            data: (games) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (index < 15) {
                      final game = games[index];
                      return GameCard(game);
                    }
                    return SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          isFirstPage ? Container() : Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: DarkTheme.buttonColor,
                            ),
                            child: InkWell(
                              onTap: () {
                                page--;
                                ref.watch(getNewReleasedGameListProvider(page));
                              },
                              child: const Center(child: Text("<<")),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text("Page $page"),
                          const SizedBox(width: 16),
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: DarkTheme.buttonColor,
                            ),
                            child: InkWell(
                              onTap: () {
                                page++;
                                ref.watch(getNewReleasedGameListProvider(page));
                              },
                              child: const Center(child: Text(">>")),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 16,
                ),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text(stackTrace.toString()),
            ),
          ),
        ],
      ),
    );
  }
}