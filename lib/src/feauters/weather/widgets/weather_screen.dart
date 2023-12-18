import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/src/feauters/search/bloc/search_bloc.dart';
import 'package:flutter_weather/src/feauters/search/data/search_dao.dart';
import 'package:flutter_weather/src/feauters/search/data/search_repositroy.dart';
import 'package:flutter_weather/src/feauters/search/widgets/search_screen.dart';
import 'package:flutter_weather/src/feauters/weather/bloc/weather_bloc.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/models.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherBloc _weatherBloc;

  String? temperature;

  Weather? weather;

  bool isLoading = false;

  String? error;

  String weatherConditionImage = 'https://openweathermap.org/img/wn/01d@2x.png';

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
          weatherConditionImage = Weather.getImage(weather!.condition);
          error = null;
        }
        if (state is WeatherError) {
          isLoading = false;
          error = state.error;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Weather App",
              style: GoogleFonts.montserrat(
                  fontSize: 30, fontWeight: FontWeight.w600),
            ),
            backgroundColor: const Color.fromRGBO(208, 162, 247, 1),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Container(
                child: weather != null
                    ? Text(weather!.location,
                        style: GoogleFonts.montserrat(
                            fontSize: 40, fontWeight: FontWeight.bold))
                    : const Text(''),
              ),
              Container(
                child: weather != null
                    ? Text(weather!.condition.name,
                        style: GoogleFonts.montserrat(
                            fontSize: 19, fontWeight: FontWeight.bold))
                    : const Text(''),
              ),
              const SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: weather != null
                        ? Row(
                            children: [
                              CachedNetworkImage(
                                height: 150,
                                width: 150,
                                imageUrl: weatherConditionImage,
                                // 'https://openweathermap.org/img/wn/${getWeatherCode(weather!)}d@2x.png', //тут исправить или убрать
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                imageBuilder: (BuildContext context,
                                    ImageProvider imageProvider) {
                                  return Container(
                                    height: 250,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Text(
                                '${weather!.temperature.ceil()}°',
                                style: GoogleFonts.montserrat(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : const Text(
                          'Выберите город для просмотра погоды!'),
                  ),
                ],
              ),
              error != null ? Text(error!) : const SizedBox.shrink(),
              Expanded(
                child: _buildHourlyWeather(),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildHourlyWeather() {
    // Здесь вам нужно создать и вернуть блок для отображения прогноза погоды по часам
    // Например, ListView с горизонтальным скроллом

    // Пример с ListView.builder для отображения данных
    return ListView.builder(
      scrollDirection: Axis.horizontal, // Горизонтальный скролл
      itemCount: 24, // Для примера показываем данные на 24 часа
      itemBuilder: (context, index) {
        // Здесь нужно вернуть элементы погоды для каждого часа
        return Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                '${index.toString().padLeft(2, '0')}:00',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, 
                ),), // Время
                CachedNetworkImage(
                                height: 50,
                                width: 50,
                                imageUrl: weatherConditionImage,
                                // 'https://openweathermap.org/img/wn/${getWeatherCode(weather!)}d@2x.png', //тут исправить или убрать
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                imageBuilder: (BuildContext context,
                                    ImageProvider imageProvider) {
                                  return Container(
                                    height: 250,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Text(
                                '${weather!.temperature.ceil()}°',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
              // Дополнительные данные о погоде (температура, иконка и т.д.)
            ],
          ),
        );
      },
    );
  }
}


