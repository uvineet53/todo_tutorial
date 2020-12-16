import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_tutorial/firestore_service/firestore_functions.dart';
import 'package:todo_tutorial/widgets/allTodotitle.dart';
import 'package:todo_tutorial/widgets/emptyList.dart';
import 'package:todo_tutorial/widgets/todolist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo",
          style: TextStyle(
              fontSize: 50, color: Colors.yellow, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _todoController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Add a new Todo...",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                textColor: Colors.white,
                color: Colors.black,
                onPressed: () {
                  print("Todo Created");
                  createTodos(_todoController.text);
                  setState(() {
                    _todoController.clear();
                  });
                },
                child: Text(
                  "Create Todo",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            allTodo(),
            SizedBox(
              height: 15,
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Todos").snapshots(),
              builder: (context, snapshots) {
                if (snapshots.hasData) {
                  return snapshots.data.documents.length == 0
                      ? emptyList()
                      : todoList(snapshots);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }
}
