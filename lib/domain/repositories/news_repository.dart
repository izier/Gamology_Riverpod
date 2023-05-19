import 'package:dartz/dartz.dart';
import 'package:gamology_riverpod/common/failure.dart';
import 'package:gamology_riverpod/domain/entities/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> getGameNewsList(int page);
}