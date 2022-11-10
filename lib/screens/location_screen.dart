import 'package:flutter/material.dart';
import 'package:tempo_template/entity/coordinates_entity.dart';
import 'package:tempo_template/services/location.dart';
import 'package:tempo_template/services/weather.dart';
import 'package:tempo_template/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final CoordinatesEntity locationWeather;

  const LocationScreen({required this.locationWeather, Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late CoordinatesEntity coordinatesEntity;
  WeatherModel weather = WeatherModel();
  Location location = Location();

  void updateUI(CoordinatesEntity weatherData) {
    setState(() {
      coordinatesEntity = weatherData;
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      getLocationWeather();
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      weather.getTemp(coordinatesEntity.getMain()
                          .getTemp().toInt()),
                      style: kTempTextStyle,
                    ),
                    Text(
                      weather.getWeatherIcon(coordinatesEntity
                          .getWeather()[0].getId()),
                      style: kConditionTextStyle,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  children: [
                    Text(
                      weather.getMessage(coordinatesEntity.getMain()
                        .getTemp().toInt()),
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                    Text(
                      weather.getCity(coordinatesEntity),
                      style: kMessageTextStyle,
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getLocationWeather() async {
    await location.getCoordinates();

    updateUI(location.getCoordinatesEntity());
  }

}
