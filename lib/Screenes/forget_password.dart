import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/Constes/backgrountcolors.dart';
import 'package:flower_app/Constes/snackbar.dart';
import 'package:flower_app/Constes/textfiled.dart';
import 'package:flower_app/Screenes/login.dart';
import 'package:flutter/material.dart';

class Fotget extends StatefulWidget {
  const Fotget({super.key});

  @override
  State<Fotget> createState() => _FotgetState();
}

class _FotgetState extends State<Fotget> {
  final forgercontorller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  void dispose() {
    forgercontorller.dispose();
    super.dispose();
  }

  resetpassword() async {
    setState(() {
      isloading = true;
    });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgercontorller.text);
      showSnackBar(context, "Password reset email sent.");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERORR ${e.code}");
    }

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text(
          "Reset Password",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Enter Your Email To Rest Your Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                TextFormField(
                  validator: (value) {
                    return value != null && !EmailValidator.validate(value)
                        ? "Enter a valid email"
                        : null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: forgercontorller,
                  obscureText: false,
                  textInputAction: TextInputAction.none,
                  keyboardType: TextInputType.emailAddress,
                  decoration: MyTextFiledStyle.copyWith(
                    hintText: "Enter Your Email",
                    suffixIcon: const Icon(Icons.email),
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w200,
                        fontSize: 17),
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      resetpassword();
                    } else {
                      showSnackBar(context, "ERROR");
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(BTNgreen),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  child: isloading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Reset Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: 18),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
