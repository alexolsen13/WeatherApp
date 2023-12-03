import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/src/feauters/weather/bloc/weather_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});


  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  late final TextEditingController searchController;

  late final WeatherBloc weatherBloc;

  @override
  void initState() {
    

    super.initState();

    weatherBloc = BlocProvider.of<WeatherBloc>(context);

    searchController = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          TextField(
            decoration: const InputDecoration(label: Text('Find your desired city'),),
          controller: searchController,
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.search_off_outlined))
        ],
      ),
      body: 
      ListView.builder(
        itemBuilder: (context, index){},),
    );
  }
}