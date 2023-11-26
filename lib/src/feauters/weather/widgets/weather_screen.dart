import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text("Weather App!"),
      actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search_outlined))],
    ), 
    body:
       const Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Text('Hello, world!'),
           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(width: 100, height: 100, child: Placeholder(),),
            SizedBox(width: 100, height: 100, child: Placeholder(),),
            SizedBox(width: 100, height: 100, child: Placeholder(),),
           ],),
           Text("Hellow World 2.0")

         ],
       ),
      
     
    );

    
  }
}