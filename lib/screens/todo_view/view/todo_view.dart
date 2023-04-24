import 'package:exam_24/screens/todo_view/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  TodoProvider? proTrue;
  TodoProvider? proFalse;

  TextEditingController txtTodo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    proFalse = Provider.of<TodoProvider>(context, listen: false);
    proTrue = Provider.of<TodoProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Todo",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text("${proTrue!.todoList[index]}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          txtTodo = TextEditingController();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: txtTodo,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Todo",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            "cancel",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // proTrue!.todoList.removeAt(index);
                                            // proFalse!.addData(txtTodo.text);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "edit",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          proFalse!.delData(index);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ));
            },
            itemCount: proTrue!.todoList.length),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: txtTodo,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Todo",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              txtTodo.clear();

                              Navigator.pop(context);
                            },
                            child: Text(
                              "cancel",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              proFalse!.addData(txtTodo.text);
                              txtTodo.clear();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "done",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
