import 'package:cloud_firestore/cloud_firestore.dart';

createTodos(String todoTitle) async {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("Todos").doc(todoTitle);

  //Map
  Map<String, String> todos = {"todoTitle": todoTitle};

  await documentReference.set(todos).whenComplete(() {
    print("$todoTitle created");
  });
}

deleteTodos(item) async {
  DocumentReference documentReference =
      FirebaseFirestore.instance.collection("Todos").doc(item);

  await documentReference.delete().whenComplete(() {
    print("$item deleted");
  });
}
