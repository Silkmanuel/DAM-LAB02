import 'package:flutter/material.dart';

Widget buttom(double w, double h, Color colors, String text) {
  return Container(
    width: w,
    height: h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: colors,
    ),
    child: Center(
        child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    )),
  );
}
