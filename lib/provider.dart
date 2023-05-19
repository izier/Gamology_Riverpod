import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamology_riverpod/data/datasources/game_data_source.dart';
import 'package:gamology_riverpod/data/datasources/news_data_source.dart';
import 'package:gamology_riverpod/data/repositories/game_repository.dart';
import 'package:gamology_riverpod/data/repositories/news_repository.dart';
import 'package:gamology_riverpod/domain/repositories/game_repository.dart';
import 'package:gamology_riverpod/domain/repositories/news_repository.dart';
import 'package:http/http.dart' as http;

//data source
final gameDataSourceProvider = Provider<GameDataSource>((_) => GameDataSourceImpl(client: http.Client()));
final newsDataSourceProvider = Provider<NewsDataSource>((_) => NewsDataSourceImpl(client: http.Client()));

//repository
final gameRepositoryProvider = Provider<GameRepository>((ref) => GameRepositoryImpl(dataSource: ref.watch(gameDataSourceProvider)));
final newsRepositoryProvider = Provider<NewsRepository>((ref) => NewsRepositoryImpl(dataSource: ref.watch(newsDataSourceProvider)));