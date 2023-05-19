import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/domain/entities/game.dart';
import 'package:gamology_riverpod/domain/usecases/get_popular_game_list.dart';
import 'package:gamology_riverpod/provider.dart';

final getPopularGameListProvider = FutureProvider.family<List<Game>, int>((ref, page) async {
  final getPopularGameList = ref.watch(getPopularGameListUseCaseProvider);
  final result = await getPopularGameList.repository.getPopularGameList(page);
  return result.fold((failure) => [], (games) => games);
});

final getPopularGameListUseCaseProvider = Provider<GetPopularGameList>((ref) {
  final repository = ref.watch(gameRepositoryProvider);
  return GetPopularGameList(repository: repository);
});