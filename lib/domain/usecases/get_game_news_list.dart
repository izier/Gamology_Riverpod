import 'package:dartz/dartz.dart';
import 'package:gamology_riverpod/common/failure.dart';
import 'package:gamology_riverpod/domain/entities/news.dart';
import 'package:gamology_riverpod/domain/repositories/news_repository.dart';

class GetGameNewsList {
  final NewsRepository repository;

  GetGameNewsList({required this.repository});

  Future<Either<Failure, List<News>>> execute(int page) {
    return repository.getGameNewsList(page);
  }
}