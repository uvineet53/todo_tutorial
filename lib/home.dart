import 'package:flutter/material.dart';
import 'package:todo_tutorial/widgets/allTodotitle.dart';
import 'package:todo_tutorial/widgets/emptyList.dart';
import 'package:todo_tutorial/widgets/todoWidget.dart';
import 'data/todoData.dart';

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
                  setState(() {
                    todo.add(_todoController.text);
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
            todo.length == 0
                ? emptyList()
                : Expanded(
                    child: ListView.builder(
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          key: Key(todo[index]),
                          onDismissed: (direction) => todo.remove(todo[index]),
                          child: todoWidget(todo[index]));
                    },
                  )),
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
