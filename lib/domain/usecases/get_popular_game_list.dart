import 'package:dartz/dartz.dart';
import 'package:gamology_riverpod/common/failure.dart';
import 'package:gamology_riverpod/domain/entities/game.dart';
import 'package:gamology_riverpod/domain/repositories/game_repository.dart';

class GetPopularGameList {
  final GameRepository repository;

  GetPopularGameList({required this.repository});

  Future<Either<Failure, List<Game>>> execute(int page) {
    return repository.getPopularGameList(page);
  }
}