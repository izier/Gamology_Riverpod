import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/domain/entities/game_detail.dart';
import 'package:gamology_riverpod/domain/usecases/get_game_detail.dart';
import 'package:gamology_riverpod/provider.dart';

final getGameDetailProvider = FutureProvider.family<GameDetail?, int>((ref, id) async {
  final getGameDetail = ref.watch(getGameDetailUseCaseProvider);
  final result = await getGameDetail.repository.getGameDetail(id);
  return result.fold((failure) => null, (games) => games);
});

final getGameDetailUseCaseProvider = Provider<GetGameDetail>((ref) {
  final repository = ref.watch(gameRepositoryProvider);
  return GetGameDetail(repository: repository);
});