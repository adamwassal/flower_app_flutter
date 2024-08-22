// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flower_app/constants/colors.dart';
import 'package:flower_app/models/item.dart';
import 'package:flower_app/provider/cart.dart';
import 'package:flower_app/screens/checkout.dart';
import 'package:flower_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  Item product;

  Details({super.key, required this.product});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool is_show = false;
  int? lines = 3;
  String text = 'Show More';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        title: Text(
          'Details screen',
        ),
        backgroundColor: appBarbg,
        actions: [
          Consumer<Cart>(builder: ((context, cartt, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 25,
                        right: 28,
                        child: Container(
                          child: Text(
                            '${cartt.selectedproducts.length}',
                            style: TextStyle(color: Colors.black),
                          ),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(211, 164, 255, 193),
                              shape: BoxShape.circle),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 7,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckOut()),
                            );
                          },
                          icon: Icon(Icons.add_shopping_cart),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    '\$ ${cartt.price}',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            );
          })),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(widget.product.imgPath),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '\$ ${widget.product.price}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 137, 129),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text('New'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.edit_location,
                            color: Colors.green,
                          ),
                          Text('${widget.product.location}')
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Text(
              'Details:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              maxLines: lines,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (is_show) {
                    lines = 3;
                    is_show = false;
                    text = 'Show More';
                  } else {
                    lines = null;
                    is_show = true;
                    text = 'Show Less';
                  }
                });
              },
              child: Text(
                '$text',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
