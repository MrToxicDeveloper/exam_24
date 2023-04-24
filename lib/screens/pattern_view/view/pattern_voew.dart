import 'package:exam_24/screens/pattern_view/pattern_provider/pattern_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatternView extends StatefulWidget {
  const PatternView({Key? key}) : super(key: key);

  @override
  State<PatternView> createState() => _PatternViewState();
}

class _PatternViewState extends State<PatternView> {
  PatternProvider? proTrue;
  PatternProvider? proFalse;

  @override
  Widget build(BuildContext context) {
    proTrue = Provider.of<PatternProvider>(context, listen: true);
    proFalse = Provider.of<PatternProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Pattern",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Slider(
                value: proTrue!.i,
                min: 1,
                max: 100,
                onChanged: (value) {
                  proFalse!.change(value);
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
