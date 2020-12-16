import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_tutorial/firestore_service/firestore_functions.dart';
import 'package:todo_tutorial/widgets/todoWidget.dart';

Widget todoList(snapshots) {
  return Expanded(
      child: ListView.builder(
    itemCount: snapshots.data.documents.length,
    itemBuilder: (context, index) {
      DocumentSnapshot documentSnapshot = snapshots.data.documents[index];
      return Dismissible(
          key: Key(documentSnapshot["todoTitle"]),
          onDismissed: (direction) =>
              deleteTodos(documentSnapshot["todoTitle"]),
          child: todoWidget(documentSnapshot["todoTitle"]));
    },
  ));
}
