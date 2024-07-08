import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/common/constants.dart';
import 'package:gamology_riverpod/presentation/provider/game_news_notifier.dart';
import 'package:gamology_riverpod/presentation/widgets/news_card.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('start scenario 3');

    int page = 1;
    bool isFirstPage = true;
    final gameNewsList = ref.watch(getGameNewsList(page));

    return Padding(
      padding: const EdgeInsets.only(top: 16,left: 8, right: 8),
      child: Column(
        children: [
          const Text('Game News', style: DarkTheme.headline1),
          const SizedBox(height: 8),
          const Text('Hottest game news'),
          const SizedBox(height: 8),
          gameNewsList.when(
            data: (news) {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (page == 1) {
                      isFirstPage = true;
                    } else {
                      isFirstPage = false;
                    }
                    if (index < 15) {
                      final newsItem = news[index];
                      print('scenario 3 finished');
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