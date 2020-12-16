import 'package:flutter/material.dart';

Container allTodo() {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
      "All Todos",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
    ),
  );
}
