import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/common/constants.dart';
import 'package:gamology_riverpod/presentation/provider/game_news_notifier.dart';
import 'package:gamology_riverpod/presentation/widgets/news_card.dart';

class GameNewsPage extends ConsumerWidget {
  GameNewsPage({super.key});

  int page = 1;
  bool isFirstPage = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameNewsList = ref.watch(getGameNewsList(page));

    return Padding(
      padding: const EdgeInsets.only(top: 16,left: 8, right: 8),
      child: Column(
        children: [
          const Text('Popular Games', style: DarkTheme.headline1),
          const SizedBox(height: 8),
          const Text('Based on ratings and popularity'),
          const SizedBox(height: 8),
          gameNewsList.when(
            data: (news) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (index < 15) {
                      final newsItem = news[index];
                      return NewsCard(news: newsItem);
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
                                ref.watch(getGameNewsList(page));
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
                                ref.watch(getGameNewsList(page));
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