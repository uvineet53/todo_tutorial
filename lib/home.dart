import 'dart:math';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:todo_tutorial/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _todoController = new TextEditingController();
  List<Map<String, dynamic>> todo = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headingText,
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  controller: _todoController,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Add a new todo...",
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black,
                      ),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _todoController.text != null ||
                                    _todoController.text != ""
                                ? todo.add({
                                    "title": _todoController.text,
                                    "date": "${formatDate(DateTime.now(), [
                                      d,
                                      ' ',
                                      M,
                                      '\'',
                                      yy
                                    ])}",
                                    "color": colors[
                                        Random().nextInt(colors.length - 1)],
                                    "checked": false,
                                  })
                                : print("Text is null");
                            _todoController.clear();
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              allTodo,
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: todo.length == 0
                    ? emptyList
                    : ListView.builder(
                        itemCount: todo.length,
                        itemBuilder: (context, index) {
                          print(todo.length);
                          return Dismissible(
                            key: Key("todo${todo[index]}"),
                            onDismissed: (direction) {
                              setState(() {
                                todo.removeAt(index);
                                print("removed at index $index");
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: todo[index]["color"],
                              ),
                              child: ListTile(
                                leading: Checkbox(
                                  value: todo[index]['checked'],
                                  activeColor: Colors.black,
                                  onChanged: (newValue) {
                                    setState(() {
                                      todo[index]["checked"] = newValue;
                                      print("changed");
                                    });
                                  },
                                ),
                                title: Text(todo[index]["title"]),
                                trailing: Text(todo[index]["date"]),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
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
