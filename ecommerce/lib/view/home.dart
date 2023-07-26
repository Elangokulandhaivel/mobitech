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
  late List<Map<String, dynamic>> data = [];
  bool state = true;
  getdata() async {
    data = await Datafetch().fetchProducts();
    setState(() {});
    if (data.isNotEmpty) {
      setState(() {
        state = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (state) {
      getdata();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 5, 10),
                    child: Column(
                      children: [
                        Image.network(data[index]['image']),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                data[index]['name'],
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                data[index]['brand'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                                child: Text("Rs ${data[index]['price']}/-"))
                          ],
                        ),
                        Row(
                          children: [
                            (data[index]['rating'] == null)
                                ? (Row(children: const [
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border),
                                    Icon(Icons.star_border)
                                  ]))
                                : (((data[index]['rating'] > 0))
                                    ? ((data[index]['rating'] > 1)
                                        ? ((data[index]['rating'] > 2)
                                            ? ((data[index]['rating'] > 3)
                                                ? ((data[index]['rating'] > 4)
                                                    ? ((data[index]['rating'] >
                                                                4 &&
                                                            data[index]
                                                                    ['rating'] <
                                                                5)
                                                        ? (Row(children: const [
                                                            Icon(Icons.star),
                                                            Icon(Icons.star),
                                                            Icon(Icons.star),
                                                            Icon(Icons.star),
                                                            Icon(
                                                                Icons.star_half)
                                                          ]))
                                                        : (Row(children: const [
                                                            Icon(Icons.star),
                                                            Icon(Icons.star),
                                                            Icon(Icons.star),
                                                            Icon(Icons.star),
                                                            Icon(Icons.star)
                                                          ])))
                                                    : (data[index]['rating'] ==
                                                            4)
                                                        ? (Row(children: const [
                                                            Icon(Icons.star),
                                                            Icon(Icons.star),
                                                            Icon(Icons.star),
                                                            Icon(Icons.star),
                                                            Icon(Icons
                                                                .star_border)
                                                          ]))
                                                        : (Row(children: const [
                                                            Icon(Icons.star),
                                                            Icon(Icons.star),
                                                            Icon(Icons.star),
                                                            Icon(Icons
                                                                .star_half),
                                                            Icon(Icons
                                                                .star_border)
                                                          ])))
                                                : (data[index]['rating'] == 3)
                                                    ? (Row(children: const [
                                                        Icon(Icons.star),
                                                        Icon(Icons.star),
                                                        Icon(Icons.star),
                                                        Icon(Icons.star_border),
                                                        Icon(Icons.star_border)
                                                      ]))
                                                    : (Row(children: const [
                                                        Icon(Icons.star),
                                                        Icon(Icons.star),
                                                        Icon(Icons.star_half),
                                                        Icon(Icons.star_border),
                                                        Icon(Icons.star_border)
                                                      ])))
                                            : (data[index]['rating'] == 2)
                                                ? (Row(children: const [
                                                    Icon(Icons.star),
                                                    Icon(Icons.star),
                                                    Icon(Icons.star_border),
                                                    Icon(Icons.star_border),
                                                    Icon(Icons.star_border)
                                                  ]))
                                                : ((Row(children: const [
                                                    Icon(Icons.star),
                                                    Icon(Icons.star_half),
                                                    Icon(Icons.star_border),
                                                    Icon(Icons.star_border),
                                                    Icon(Icons.star_border)
                                                  ]))))
                                        : (data[index]['rating'] == 1)
                                            ? (Row(children: const [
                                                Icon(Icons.star),
                                                Icon(Icons.star_border),
                                                Icon(Icons.star_border),
                                                Icon(Icons.star_border),
                                                Icon(Icons.star_border)
                                              ]))
                                            : (Row(children: const [
                                                Icon(Icons.star_half),
                                                Icon(Icons.star_border),
                                                Icon(Icons.star_border),
                                                Icon(Icons.star_border),
                                                Icon(Icons.star_border)
                                              ])))
                                    : (Row(children: const [
                                        Icon(Icons.star_border),
                                        Icon(Icons.star_border),
                                        Icon(Icons.star_border),
                                        Icon(Icons.star_border),
                                        Icon(Icons.star_border)
                                      ]))),
                            Flexible(
                                child: Text(data[index]['rating'].toString()))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
