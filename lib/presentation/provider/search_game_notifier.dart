import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/domain/entities/game.dart';
import 'package:gamology_riverpod/domain/usecases/search_game.dart';
import 'package:gamology_riverpod/provider.dart';

final gameSearchProvider = FutureProvider.family<List<Game>, String>((ref, query) async {
  final gameSearch = ref.watch(gameSearchUseCaseProvider);
  final result = await gameSearch.repository.searchGame(query);
  return result.fold((failure) => [], (games) => games);
});

final gameSearchUseCaseProvider = Provider<SearchGame>((ref) {
  final repository = ref.watch(gameRepositoryProvider);
  return SearchGame(repository: repository);
});