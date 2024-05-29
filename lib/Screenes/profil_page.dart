import 'package:flower_app/Constes/backgrountcolors.dart';
import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            label: const Text(
              "Logout",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          )
        ],
        backgroundColor: appbarGreen,
        title: const Text(
          "Profile Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          )),
    );
  }
}
