import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_color.dart';
import 'package:weather_app/data/api_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic tempInFahrenheitStr = Weather.weatherData.last['main']['temp'];
    dynamic maxTempInFahrenheitStr =
        Weather.weatherData.last['main']['temp_max'];
    dynamic minTempInFahrenheitStr =
        Weather.weatherData.last['main']['temp_min'];
    double tempInCelsius = tempInFahrenheitStr - 273.15;
    double minTempInCelsius = minTempInFahrenheitStr - 273.15;
    double maxTempInCelsius = maxTempInFahrenheitStr - 273.15 + 5;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather02-512.png",
                // width: 120,
              ),
              Text(
                "${tempInCelsius.toStringAsFixed(2)}°C",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.primary,
                  fontSize: 32,
                ),
              ),
              Text(
                Weather.weatherData.last['name'],
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "MAX: ${maxTempInCelsius.toStringAsFixed(2)}°C",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "MIN: ${minTempInCelsius.toStringAsFixed(2)}°C",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Text(
                "Humidity: ${Weather.weatherData.last['main']['humidity']}"
                    .toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "Wind Speed: ${Weather.weatherData.last['wind']['speed']}"
                    .toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAwj22-J1A3K24NSL9WQszABXVF9OGDR2-pnRbBlWXSA&s",
                // width: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
