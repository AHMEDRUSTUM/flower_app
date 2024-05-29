import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/Constes/AppBarr.dart';
import 'package:flower_app/Constes/backgrountcolors.dart';
import 'package:flower_app/Screenes/checkout.dart';
import 'package:flower_app/Screenes/detailsScreen.dart';
import 'package:flower_app/Screenes/profil_page.dart';
import 'package:flower_app/model/item.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assetes/img/test.jpg"),
                          fit: BoxFit.cover),
                    ),
                    accountName: Text(user.displayName!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        )),
                    accountEmail: Text(user.email!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        )),
                    currentAccountPicture: CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                    currentAccountPictureSize: Size.square(80),
                  ),
                  ListTile(
                    title: const Text("Home"),
                    leading: const Icon(Icons.home),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("My products"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Checkout()),
                      );
                    },
                    leading: const Icon(Icons.add_shopping_cart),
                  ),
                  ListTile(
                    title: const Text("About"),
                    leading: const Icon(Icons.help_center),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Profile Page"),
                    leading: const Icon(Icons.person),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profil(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Logout"),
                    leading: const Icon(Icons.exit_to_app),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text("Developed by Ahmet AlRustum ©2024",
                    style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [Bar()],
          backgroundColor: appbarGreen,
          title: Text("Home"),
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Details(product: items[index])),
                      );
                    },
                    child: GridTile(
                      child: Image.asset("${items[index].imgPath}",
                          fit: BoxFit.cover),
                      footer: GridTileBar(
                        trailing:
                            Consumer<Cart>(builder: ((context, cart1, child) {
                          return IconButton(
                            color: const Color.fromARGB(255, 62, 94, 70),
                            onPressed: () {
                              cart1.add(items[index]);
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          );
                        })),
                        leading: Text(
                          "\$ ${items[index].price}",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        title: Text(""),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
