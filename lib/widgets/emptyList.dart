import 'package:flutter/material.dart';

Expanded emptyList() {
  return Expanded(
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          "List is Empty...",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    ),
  );
}
