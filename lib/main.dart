import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weather_app/Future/Weather/Data/DataSource/remote_data_source.dart';
import 'package:flutter_weather_app/Future/Weather/Data/Resository/weather_repository.dart';
import 'package:flutter_weather_app/Future/Weather/Domain/Entities/weather.dart';
import 'package:flutter_weather_app/Future/Weather/Domain/Repository/base_weather_repository.dart';
import 'package:flutter_weather_app/Future/Weather/Domain/UseCase/get_weather_by_country_name.dart';

Future<void> main() async {


  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: HomePage(),
    );
  }
}


class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Consumer(
             builder: (context,prov,_)=> Center(
               child: Column(
                 children: [
                   Text('ID: ${prov.watch(_data).id == null ? "No Id" : "${prov.read(_data).id}"}') ,
                   Text('Name: ${prov.read(_data).name ?? "No Name"}') ,
                   Text('Description: ${prov.read(_data).desc ?? "No Description"}') ,
                   Text('Main: ${prov.read(_data).main ?? "No Main"}') ,
                   Text('Pressure: ${prov.read(_data).pressure == null ? "No Pressure" : "${prov.read(_data).pressure}"}')
                 ],
               ),
             )) ,


          MaterialButton(
            onPressed: () async {
            BaseRemoteDataSource remoteDataSource = RemoteDataSource();
            BaseWeatherRepository baseWeatherRepository = WeatherRepository(remoteDataSource);
            //Weather weather = await baseWeatherRepository.gitWeatherByCityName('London');
            Weather weather = await GetWeatherByCountryName(baseWeatherRepository).execute("Egypt");

            ref.read(_data).getData(weather);

          },child: const Text("Show"),color: Colors.red,textColor: Colors.white,)

        ],
      ),
    );
  }
}

final _data = ChangeNotifierProvider<HomePageState>((ref)=>HomePageState());

class HomePageState extends ChangeNotifier {
    String? name , main , desc ;
    int? id , pressure ;

  void getData(Weather weather_) {
    id = weather_.id;
    name = weather_.cityName;
    main = weather_.main;
    desc = weather_.description;
    pressure = weather_.pressure;
    notifyListeners();
  }
}
