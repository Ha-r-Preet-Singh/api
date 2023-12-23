import 'dart:convert';

import 'package:api_intro_46/models/products/data_product_model.dart';
import 'package:flutter/material.dart';

//htttp package impport krna paouga
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<DataProductModel> mData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mData = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Products"),
      ),
      body: FutureBuilder<DataProductModel>(
        future: mData,
        builder: (_, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return Center(child: Text("Error: ${snapshot.error}"),);

          }else if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.products!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.network(snapshot.data!.products![index].thumbnail.toString(),fit: BoxFit.cover,)),
                  title: Text(snapshot.data!.products![index].title.toString()),
                  subtitle: Text(snapshot.data!.products![index].description.toString()),
                  trailing: Text(snapshot.data!.products![index].price.toString()),
                );
              },
            );

          }
          return Container();

        },
      ),
    );
  }

  Future<DataProductModel> getProducts() async {
    // Uri mUrl = Uri.parse("https://dummyjson.com/products");
    var res = await http.get(Uri.parse("https://dummyjson.com/products"));

    print("SC: ${res.statusCode},RES:${res.body}");
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      return DataProductModel.fromJson(json);
    } else {
    return  DataProductModel();
    }
  }
}
