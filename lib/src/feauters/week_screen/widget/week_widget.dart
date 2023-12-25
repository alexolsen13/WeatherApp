import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/daily_weather.dart';
import 'package:flutter_weather/src/feauters/weather/data/models/weather.dart';

class WeekWidget extends StatefulWidget {
  final DailyWeather? dailyWeather;
  const WeekWidget({super.key, this.dailyWeather});

  @override
  State<WeekWidget> createState() => _WeekWidgetState();
}

class _WeekWidgetState extends State<WeekWidget> {
  Widget bodyChild() {
    if (widget.dailyWeather == null) {
      return const Center(
        child: Text('Нет данных о погоде'),
      );
    } else {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.dailyWeather!.date.length,
          itemBuilder: (context, index) {
            final date =
                DateTime.parse(widget.dailyWeather!.date[index].toString());
            return Container(
              clipBehavior: Clip.hardEdge,
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.3),
                    blurRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CachedNetworkImage(
                      imageUrl: Weather.getImage(
                        widget.dailyWeather!.condition[index],
                      ),
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '${date.day}/${date.month}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      widget.dailyWeather!.temperature[index].toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(8.0),
      child: bodyChild(),
    );
  }
}
