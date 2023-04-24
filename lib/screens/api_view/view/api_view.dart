import 'package:exam_24/screens/api_view/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiView extends StatefulWidget {
  const ApiView({Key? key}) : super(key: key);

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {

  ApiProvider? proTrue;
  ApiProvider? proFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).apicaller();
  }

  @override
  Widget build(BuildContext context) {
    proFalse = Provider.of<ApiProvider>(context, listen: false);
    proTrue = Provider.of<ApiProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Corona cases",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text("${index+1}"),
                title: Text(
                    "${proTrue!.coronaModel!.countriesStat[index].countryName}"),
                subtitle: Text(
                    "${proTrue!.coronaModel!.countriesStat[index].activeCases}"),
                trailing: IconButton(
                    onPressed: () => Navigator.pushNamed(context, 'detail',
                        arguments: index),
                    icon: Icon(Icons.navigate_next)),
              );
            },
            itemCount: proTrue!.coronaModel!.countriesStat.length,
          ),
        ),
      ),
    );
  }
}
