import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/domain/entities/news.dart';
import 'package:gamology_riverpod/domain/usecases/get_game_news_list.dart';
import 'package:gamology_riverpod/provider.dart';

final getGameNewsList = FutureProvider.family<List<News>, int>((ref, page) async {
  final getGameNews = ref.watch(getGameNewsUseCaseProvider);
  final result = await getGameNews.repository.getGameNewsList(page);
  return result.fold((failure) => [], (games) => games);
});

final getGameNewsUseCaseProvider = Provider<GetGameNewsList>((ref) {
  final repository = ref.watch(newsRepositoryProvider);
  return GetGameNewsList(repository: repository);
});