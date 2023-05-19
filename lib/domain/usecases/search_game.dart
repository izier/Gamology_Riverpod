import 'package:dartz/dartz.dart';
import 'package:gamology_riverpod/common/failure.dart';
import 'package:gamology_riverpod/domain/entities/game.dart';
import 'package:gamology_riverpod/domain/repositories/game_repository.dart';

class SearchGame {
  final GameRepository repository;

  SearchGame({required this.repository});

  Future<Either<Failure, List<Game>>> execute(String query) {
    return repository.searchGame(query);
  }
}