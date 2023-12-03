import 'package:flutter_weather/src/feauters/search/data/search_dao.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/location.dart';

abstract class SearchRepository {
  SearchRepository(searhcRemoteDataSource);

  Future<List<Location>> search(String query);
}

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Location>> search(String query) async {
    try {
      final result = await remoteDataSource.search(query);
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
