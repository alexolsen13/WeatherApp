import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/src/feauters/search/bloc/search_bloc.dart';
import 'package:flutter_weather/src/feauters/search/data/search_dao.dart';
import 'package:flutter_weather/src/feauters/search/data/search_repositroy.dart';
import 'package:flutter_weather/src/feauters/search/widgets/search_screen.dart';
import 'package:flutter_weather/src/feauters/weather/bloc/weather_bloc.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/models.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherBloc _weatherBloc;
  Weather? weather;
  bool isLoading = false;
  String? error;

  Color _colorSelecter(double temp) {
    switch (temp) {
      case < -10:
        return const Color.fromARGB(255, 90, 73, 185);
      case < 0:
        return const Color.fromARGB(255, 120, 106, 197);
      case < 10:
        return const Color.fromARGB(255, 122, 226, 191);
      case < 20:
        return const Color.fromARGB(255, 118, 238, 128);
      case < 30:
        return const Color.fromARGB(255, 216, 99, 70);

      default:
        return Colors.white;
    }
  }

  // String _getWeatherIcon(String condition) {
  //   switch (condition) {
  //     case 'Clear':
  //       return 'assets/sun.png';
  //     case 'Clouds':
  //       return 'assets/cloud.png';
  //     case 'Rain':
  //       return 'assets/rain.png';
  //     case 'Snow':
  //       return 'assets/snow.png';
  //     case 'Thunderstorm':
  //       return 'assets/storm.png';
  //     case 'Drizzle':
  //       return 'assets/drizzle.png';
  //     default:
  //       return 'assets/sun.png';
  //   }
  // }

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
        if (state is WeatherLoading) {
          isLoading = true;
          error = null;
        }
        if (state is WeatherLoaded) {
          isLoading = false;
          weather = state.weatherData;
          error = null;
        }
        if (state is WeatherError) {
          isLoading = false;
          error = state.error;
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Weather App!"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(providers: [
                          BlocProvider(
                            create: (context) => SearchBloc(
                                SearchRepositoryImpl(
                                    SearchRemoteDataSourceImpl())),
                          ),
                          BlocProvider.value(value: _weatherBloc)
                        ], child: const SearchScreen()),
                      ),
                    );
                  },
                  icon: const Icon(Icons.search_outlined))
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.network(
              //     'https://upload.wikimedia.org/wikipedia/commons/0/01/Business_Centre_of_Moscow_2.jpg'),
              weather != null ? Text(weather!.location) : const Text('No Data'),
              weather != null
                  ? Text(weather!.condition.name)
                  : const Text('No Data'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: _colorSelecter(weather?.temperature ?? 10),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black87,
                            spreadRadius: 4,
                            blurRadius: 4,
                          ),
                        ]),
                    child: weather != null
                        ? Row(
                            children: [
                              // Image.asset(_getWeatherIcon(
                              //     weather?.condition.name ?? 'Clear')),
                              Text(weather!.temperature.toString()),
                            ],
                          )
                        : const Text('No Data'),
                  ),
                ],
              ),
              error != null ? Text(error!) : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
