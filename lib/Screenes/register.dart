import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/Constes/backgrountcolors.dart';
import 'package:flower_app/Constes/snackbar.dart';
import 'package:flower_app/Constes/textfiled.dart';
import 'package:flower_app/Screenes/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isvisibel = true;
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();

  bool ispassword8char = false;
  bool ispassword1number = false;
  bool ispasswordUpper = false;
  bool ispasswordLower = false;
  bool ispasswordSpecial = false;

  onPasswordChanged(String password) {
    ispassword8char = false;
    ispassword1number = false;
    ispasswordUpper = false;
    ispasswordLower = false;
    ispasswordSpecial = false;

    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        ispassword8char = true;
      }
      if (password.contains(RegExp(r'[0-9]'))) {
        ispassword1number = true;
      }
      if (password.contains(RegExp(r'[a-z]'))) {
        ispasswordLower = true;
      }
      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        ispasswordSpecial = true;
      }
      if (password.contains(RegExp(r'[A-Z]'))) {
        ispasswordUpper = true;
      }
    });
  }

  register() async {
    setState(() {
      isloading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, "The account already exists for that email.");
      } else {
        showSnackBar(context, "ERROR - please try agian late");
      }
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: namecontroller,
                    decoration: MyTextFiledStyle.copyWith(
                      hintText: "Enter Your UeserName :",
                      suffixIcon: const Icon(Icons.person),
                      hintStyle: const TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w200,
                          fontSize: 17),
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: namecontroller,
                    decoration: MyTextFiledStyle.copyWith(
                      hintText: "Enter Your age :",
                      suffixIcon: const Icon(Icons.add_chart),
                      hintStyle: const TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w200,
                          fontSize: 17),
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: namecontroller,
                    decoration: MyTextFiledStyle.copyWith(
                      hintText: "Enter Your Title :",
                      suffixIcon: const Icon(Icons.person_add_alt_1_outlined),
                      hintStyle: const TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w200,
                          fontSize: 17),
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      return value != null && !EmailValidator.validate(value)
                          ? "Enter a valid email"
                          : null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailcontroller,
                    decoration: MyTextFiledStyle.copyWith(
                      hintText: "Enter Your Email :",
                      suffixIcon: const Icon(Icons.email),
                      hintStyle: const TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w200,
                          fontSize: 17),
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      return value.toString().length < 8
                          ? "Enter a valid email"
                          : null;
                    },
                    onChanged: (password) {
                      onPasswordChanged(password);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordcontroller,
                    decoration: MyTextFiledStyle.copyWith(
                      hintText: "Enter Your Password :",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isvisibel = !isvisibel;
                            });
                          },
                          icon: Icon(isvisibel
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      hintStyle: const TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w200,
                          fontSize: 17),
                      // icon: Icon(Icons.visibility),
                    ),
                    obscureText: isvisibel ? true : false,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            shape: BoxShape.circle,
                            color: ispassword8char ? BTNgreen : Colors.white,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text("At Least 8 characters"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            shape: BoxShape.circle,
                            color: ispassword1number ? BTNgreen : Colors.white,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text("At Least 1 number"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            shape: BoxShape.circle,
                            color: ispasswordUpper ? BTNgreen : Colors.white,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text("Has UpperCase"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            shape: BoxShape.circle,
                            color: ispasswordLower ? BTNgreen : Colors.white,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text("Has LowerCase"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            shape: BoxShape.circle,
                            color: ispasswordSpecial ? BTNgreen : Colors.white,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text("Has Special Characters"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() &&
                          ispassword8char &&
                          ispassword1number &&
                          ispasswordUpper &&
                          ispasswordLower &&
                          ispasswordSpecial) {
                        await register();
                        if (!mounted) return;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
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
                            "Register",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: 18),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Aleady hava an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: const Text(
                          "sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
