import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:gamology_riverpod/common/exception.dart';
import 'package:gamology_riverpod/common/failure.dart';
import 'package:gamology_riverpod/data/datasources/news_data_source.dart';
import 'package:gamology_riverpod/domain/entities/news.dart';
import 'package:gamology_riverpod/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource dataSource;

  NewsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<News>>> getGameNewsList(int page) async {
    try {
      final result = await dataSource.getGameNewsList(page);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }
}