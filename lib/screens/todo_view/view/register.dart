import 'package:exam_24/screens/todo_view/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            "Register",
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
                  proFalse!.saveData(txtName.text, txtPass.text);
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: Text("Register"),
              ),
              SizedBox(
                height: 5,
              ),TextButton(onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              }, child: Text("Already have an account? Log-in"))
            ],
          ),
        ),
      ),
    );
  }
}
