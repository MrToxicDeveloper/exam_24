import 'dart:ffi';

import 'package:exam_24/screens/api_view/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetaislView extends StatefulWidget {
  const DetaislView({Key? key}) : super(key: key);

  @override
  State<DetaislView> createState() => _DetaislViewState();
}

class _DetaislViewState extends State<DetaislView> {
  ApiProvider? proTrue;
  ApiProvider? proFalse;

  int? index;

  @override
  Widget build(BuildContext context) {
    proFalse = Provider.of<ApiProvider>(context, listen: false);
    proTrue = Provider.of<ApiProvider>(context, listen: true);
    index = ModalRoute.of(context)!.settings.arguments as int?;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "${proTrue!.coronaModel!.countriesStat[index!].countryName}",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total cases :- ${proTrue!.coronaModel!.countriesStat[index!].cases}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Active cases :- ${proTrue!.coronaModel!.countriesStat[index!].activeCases}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Recovered :- ${proTrue!.coronaModel!.countriesStat[index!].totalRecovered}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Deaths :- ${proTrue!.coronaModel!.countriesStat[index!].deaths}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Tests :- ${proTrue!.coronaModel!.countriesStat[index!].totalTests}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
