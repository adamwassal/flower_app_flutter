// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flower_app/constants/colors.dart';
import 'package:flower_app/models/item.dart';
import 'package:flower_app/provider/cart.dart';
import 'package:flower_app/screens/checkout.dart';
import 'package:flower_app/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Home',
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
                            Navigator.push(
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
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'adam',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text('adamwassal2@gmail.com',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/imgs/avatar.JPG'),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('imgs/bg.jpg'), fit: BoxFit.cover)),
                ),
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Cart'),
                  leading: Icon(Icons.add_shopping_cart),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckOut()),
                    );
                  },
                ),
                ListTile(
                  title: Text('About'),
                  leading: Icon(Icons.help_center),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.logout),
                  onTap: () {},
                ),
              ],
            ),
            Container(
              child: Text(
                'Designed by adam wael © 2024',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              margin: EdgeInsets.only(bottom: 10),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 17.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 33),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(product: items[index]),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Positioned(
                            top: -3,
                            bottom: -9,
                            right: 0,
                            left: 0,
                            child: Image.asset(items[index].imgPath))
                      ],
                    )),
                footer: GridTileBar(
                  trailing: Consumer<Cart>(builder: ((context, cart, child) {
                    return IconButton(
                        color: Color.fromARGB(255, 0, 98, 255),
                        onPressed: () {
                          cart.add(items[index]);
                        },
                        icon: Icon(Icons.add));
                  })),
                  leading: Text(
                    "\$ ${items[index].price.toString()}",
                    style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  title: Text(
                    "",
                  ),
                ),
              );
            }),
      ),
    );
  }
}
