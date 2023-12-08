import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/src/feauters/search/bloc/search_bloc.dart';
import 'package:flutter_weather/src/feauters/weather/bloc/weather_bloc.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/location.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController searchController;

  late final WeatherBloc weatherBloc;

  late final SearchBloc searchBloc;

  List<Location> cities = [];

  String? error;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    searchBloc = BlocProvider.of<SearchBloc>(context);
    searchController = TextEditingController();
  }

  @override
  dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          isLoading = true;
          error = null;
        }
        if (state is SearchLoaded) {
          isLoading = false;
          cities = state.cities;
          cities.toSet().toList();
          error = null;
        }
        if (state is SearchError) {
          isLoading = false;
          error = state.message;
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(255, 248, 201, 1),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Expanded(
                child: IntrinsicWidth(
                  stepWidth: 100,
                  child: TextField(
                    decoration: const InputDecoration(
                      label: Text('Find your desired city'),
                    ),
                    controller: searchController,
                    onSubmitted: (value) {
                      searchBloc.add(SearchEventSearch(value));
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  searchBloc.add(SearchEventSearch(searchController.text));
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: cities.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  weatherBloc.add(WeatherFetchEvent(cities[index]));
                  Navigator.of(context).pop();
                },
                title: Text(cities[index].name),
              );
            },
          ),
        );
      },
    );
  }
}
