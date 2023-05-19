import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/domain/entities/game.dart';
import 'package:gamology_riverpod/domain/usecases/get_new_released_game_list.dart';
import 'package:gamology_riverpod/provider.dart';

final getNewReleasedGameListProvider = FutureProvider.family<List<Game>, int>((ref, page) async {
  final getNewReleasedGameList = ref.watch(getNewReleasedGameListUseCaseProvider);
  final result = await getNewReleasedGameList.repository.getNewReleasedGameList(page);
  return result.fold((failure) => [], (games) => games);
});

final getNewReleasedGameListUseCaseProvider = Provider<GetNewReleasedGameList>((ref) {
  final repository = ref.watch(gameRepositoryProvider);
  return GetNewReleasedGameList(repository: repository);
});