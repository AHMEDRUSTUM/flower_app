import 'package:flower_app/Constes/AppBarr.dart';
import 'package:flower_app/Constes/backgrountcolors.dart';
import 'package:flower_app/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final cart2 = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text(
          "Checkout Screen",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [Bar()],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: cart2.selectproduct.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      subtitle: Text(
                          "\$ ${cart2.selectproduct[index].price} - ${cart2.selectproduct[index].lcoation}"),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("${cart2.selectproduct[index].imgPath}"),
                      ),
                      title: Text("${cart2.selectproduct[index].name}"),
                      trailing: IconButton(
                          onPressed: () {
                            cart2.delete(index);
                          },
                          icon: Icon(Icons.remove)),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(BTNpink)),
            child: Text(
              "Pay   \$${cart2.fiyat()}",
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
