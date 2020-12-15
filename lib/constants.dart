import 'package:flutter/material.dart';

var headingText = Text(
  "Hi\nThere!",
  style: TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.bold,
  ),
);
List<Color> colors = [
  Colors.purple[100],
  Colors.yellow[100],
  Colors.green[100],
  Colors.orange[100],
  Colors.brown[100],
];

var emptyList = Center(
  child: Container(
    height: 200,
    width: 300,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: colors[3],
    ),
    child: Center(
      child: Text(
        "Todolist is empty..",
        style: TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
);

var allTodo = Container(
  padding: EdgeInsets.all(10),
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15), color: Colors.black),
  child: Text(
    "All Todos",
    style: TextStyle(
        fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
  ),
);
