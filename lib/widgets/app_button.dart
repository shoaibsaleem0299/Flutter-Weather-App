import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_color.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final void Function() onButtonTap;
  const AppButton(
      {super.key, required this.buttonText, required this.onButtonTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 6,
      height: 35,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColor.primary),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        ),
        onPressed: onButtonTap,
        child: Text(
          buttonText,
          style: TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
