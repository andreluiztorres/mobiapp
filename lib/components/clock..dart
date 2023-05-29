// ignore_for_file: file_names, depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DigitalClock(
          areaDecoration: BoxDecoration(
            color: Colors.transparent,
          ),
          minuteDigitDecoration: BoxDecoration(
            color: Colors.transparent,
          ),
          secondDigitDecoration: BoxDecoration(
            color: Colors.transparent,
          ),
          hourMinuteDigitTextStyle: const TextStyle(
            color: Color.fromARGB(255, 34, 34, 44),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          colon: const Text(
            ':',
            style: TextStyle(
              color: Color.fromARGB(255, 34, 34, 44),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          secondDigitTextStyle: const TextStyle(
            color: Color.fromARGB(255, 34, 34, 44),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          is24HourTimeFormat: true,
        ),
        const SizedBox(width: 5),
        Text('REGISTRAR PONTO',
            style: TextStyle(
                color: Color.fromARGB(255, 34, 34, 44),
                fontSize: 16,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
