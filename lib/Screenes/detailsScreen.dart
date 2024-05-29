import 'package:flower_app/Constes/AppBarr.dart';
import 'package:flower_app/Constes/backgrountcolors.dart';
import 'package:flower_app/model/item.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Item product;
  Details({required this.product});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool showmoer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text(
          "Dedails Screen",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [Bar()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage(widget.product.imgPath),
              fit: BoxFit.cover,
              height: 350,
              width: double.infinity,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "\$${widget.product.price}",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "New",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                      size: 30,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                      size: 30,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                      size: 30,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                      size: 30,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 35,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.edit_location,
                      color: appbarGreen,
                      size: 22,
                    ),
                    GestureDetector(
                      child: Text("Flower Shop"),
                      onTap: () {},
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 10),
              child: const Text(
                "Details :",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                widget.product.ozelikler,
                style: TextStyle(fontSize: 18),
                maxLines: showmoer ? null : 4,
                overflow: TextOverflow.fade,
              ),
            ),
            GestureDetector(
              child: Text(
                showmoer ? "Show Less" : "Show More",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue[500]),
              ),
              onTap: () {
                setState(() {
                  showmoer = !showmoer;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
