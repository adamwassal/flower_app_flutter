// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flower_app/constants/colors.dart';
import 'package:flower_app/models/item.dart';
import 'package:flower_app/provider/cart.dart';
import 'package:flower_app/screens/details.dart';
import 'package:flower_app/screens/home.dart';

class CheckOut extends StatefulWidget {
  CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Check out'),
        backgroundColor: appBarbg,
        actions: [
          Consumer<Cart>(
            builder: (context, cartt, child) {
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
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(211, 164, 255, 193),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${cartt.selectedproducts.length}',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 7,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add_shopping_cart),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      '\$${cartt.price}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return Column(
            children: [
              SingleChildScrollView(
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: cart.selectedproducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          subtitle: Text(
                            "\$${cart.selectedproducts[index].price} -- ${cart.selectedproducts[index].location}",
                          ),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                cart.selectedproducts[index].imgPath),
                          ),
                          title: Text(cart.selectedproducts[index].name),
                          trailing: IconButton(
                            onPressed: () {
                              cart.delete(cart.selectedproducts[index]);
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Pay \$${cart.price}',
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.pink),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)),
              ),
            ],
          );
        },
      ),
    );
  }
}
