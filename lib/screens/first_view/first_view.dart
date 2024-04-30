// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_color.dart';
import 'package:weather_app/data/api_data.dart';
import 'package:weather_app/screens/home_view/home_view.dart';
import 'package:weather_app/widgets/app_button.dart';
import 'package:weather_app/widgets/user_input_field.dart';
import 'package:http/http.dart' as http;

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController city = TextEditingController();
    Future<void> getWeather() async {
      var url =
          "https://api.openweathermap.org/data/2.5/weather?q=${city.text}&appid=d95569ac274832d6e1e6743e688007f3";
      try {
        final response = await http.get(Uri.parse(url));
        var responseBody = jsonDecode(response.body);
        if (response.statusCode == 200) {
          Weather.weatherData.add(responseBody);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              content: const Center(
                child: Text(
                  "Incorrect city",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "https://cdn2.iconfinder.com/data/icons/weather-flat-14/64/weather02-512.png"),
              const SizedBox(
                height: 50,
              ),
              UserInputField(
                controller: city,
              ),
              const SizedBox(
                height: 16,
              ),
              AppButton(
                  buttonText: "Get Weather",
                  onButtonTap: () async {
                    await getWeather();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
