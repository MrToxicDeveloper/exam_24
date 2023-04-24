import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Select App",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, 'pattern'),
                child: Text("Pattern App"),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, 'todo'),
                child: Text("Todo App"),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'api'),
                child: Text("API App"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
