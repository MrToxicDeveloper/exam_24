import 'package:exam_24/screens/todo_view/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TodoProvider? proTrue;
  TodoProvider? proFalse;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    proFalse = Provider.of<TodoProvider>(context, listen: false);
    proTrue = Provider.of<TodoProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Log in",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: txtName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter username"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: txtPass,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter username"),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Future<Map> m1 = proFalse!.readData();
                  // if (txtName.text == m1['username'] && txtPass.text == m1['pass']) {
                  //   Navigator.pushReplacementNamed(context, 'todo');
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text("Invalid Id or Pass"),
                  //     ),
                  //   );
                  // }
                },
                child: Text("Log In"),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'reg');
                  },
                  child: Text("Don't have an account? Register"))
            ],
          ),
        ),
      ),
    );
  }
}
