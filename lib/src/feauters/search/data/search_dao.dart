import 'package:flutter_weather/src/feauters/weather/data/models/models.dart';
import 'package:flutter_weather/src/feauters/weather/data/open_meteo/api_client.dart';

abstract class SearchRemoteDataSource {
  Future<List<Location>> search(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl();

  @override
  Future<List<Location>> search(String query) async {
    return await OpenMeteoApiClient().locationSearch(query);
  }
}
