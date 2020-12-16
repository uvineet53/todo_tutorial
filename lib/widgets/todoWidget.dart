import 'package:flutter/material.dart';

Widget todoWidget(String title) {
  return Container(
    height: 70,
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    ),
  );
}
