import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/domain/entities/game.dart';
import 'package:gamology_riverpod/domain/usecases/get_top_rated_game_list.dart';
import 'package:gamology_riverpod/provider.dart';

final getTopRatedListProvider = FutureProvider.family<List<Game>, int>((ref, page) async {
  final getTopRatedList = ref.watch(getTopRatedListUseCaseProvider);
  final result = await getTopRatedList.repository.getTopRatedGameList(page);
  return result.fold((failure) => [], (games) => games);
});

final getTopRatedListUseCaseProvider = Provider<GetTopRatedGameList>((ref) {
  final repository = ref.watch(gameRepositoryProvider);
  return GetTopRatedGameList(repository: repository);
});