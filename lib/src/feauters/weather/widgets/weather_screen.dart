import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/src/feauters/weather/bloc/weather_bloc.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/models.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherBloc _weatherBloc;
  TextEditingController textController = TextEditingController();
  Weather? weather;
  bool isLoading = false;
  String? error;

  @override
  void initState() {
    super.initState();
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: _weatherBloc,
      builder: (context, state) {
        if(state is WeatherLoading){
          isLoading = true;
          error = null;
        }
        if(state is WeatherLoaded){
          isLoading = false;
          weather = state.weatherData;
          error = null;
        }
        if(state is WeatherError){
          isLoading = false;
          error = state.error;
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Weather App!"),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_outlined))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               weather != null?
               Text(weather!.location): const Text('No Data'),
               weather != null?
               Text(weather!.condition.name): const Text('No Data'),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: weather != null?
               Text(weather!.temperature.toString()): const Text('No Data'),
                  ),
                ],
              ),
               error != null?
               Text(error!): const SizedBox.shrink(),
               TextField(controller: textController,),
              MaterialButton(
                onPressed: () {
                  if(textController.text.isNotEmpty){
                    _weatherBloc.add(WeatherFetchEvent(textController.text));
                  }
                },
                child: const Text('Load'),
              )
            ],
          ),
        );
      },
    );
  }
}
