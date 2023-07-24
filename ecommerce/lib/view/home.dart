import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../controller/datacontroller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data;

  getdata() async {
    data = await Datafetch().fetchProducts();
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: SingleChildScrollView(child: Text(data.toString())));
  }
}
