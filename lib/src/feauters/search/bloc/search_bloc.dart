import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather/src/feauters/search/data/search_repositroy.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/location.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepositoryImpl _searchRepository;
  SearchBloc(this._searchRepository) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {});

    on<SearchEventSearch>((event, emit) async {
      emit(SearchLoading());
      await _searchRepository.search(event.query).then((cities) {
        emit(SearchLoaded(cities));
      }).catchError((e) {
        emit(SearchError(e.toString()));
      });
    });
  }
}
