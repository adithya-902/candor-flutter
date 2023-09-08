// ignore_for_file: use_build_context_synchronously

import 'package:candor_flutter/screens/verify_email.dart';
import 'package:candor_flutter/services/auth_services.dart';
import 'package:candor_flutter/utils/colours.dart';
import 'package:candor_flutter/widgets/presenting_candor.dart';
import 'package:candor_flutter/widgets/text_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final Function()? onTap;
  const SignUpScreen({super.key, required this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  //final TextEditingController _biocontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();

  void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (_passwordcontroller.text == _confirmpasswordcontroller.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailcontroller.text, password: _passwordcontroller.text);
        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VerifyEmail() ));
        Navigator.pop(context);
      } else {
        showErrorMessage("Passwords do not match");
      }
    } on FirebaseAuthException catch (err) {
      Navigator.pop(context);
      if (err.code == "user-not-found") {
        showErrorMessage("Incorrect E-Mail");
      } else if (err.code == "wrong-password") {
        showErrorMessage("Incorrect Password");
      } else {
        showErrorMessage(err.code);
      }
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                message,
                style: const TextStyle(
                    color: Colors.white, fontFamily: "Tanker", fontSize: 30),
              ),
            ),
            backgroundColor: theYellowColor,
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    // _usernamecontroller.dispose();
    // _biocontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: ListView(
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    height: 100,
                  )),
              const presenting_candor(),
              const SizedBox(
                height: 30,
              ),
              TextFieldInput(
                  textEditingController: _emailcontroller,
                  hintText: "E-mail",
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                  textEditingController: _passwordcontroller,
                  hintText: "Password",
                  isPass: true,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _confirmpasswordcontroller,
                hintText: " Confirm Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: signUserUp,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: Colors.amber),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 30, fontFamily: "Tanker", letterSpacing: 5.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () => AuthService().signInWithGoogle(),
                child: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Image.asset(
                      'assets/google_logo.png',
                      height: 60,
                    ),
                    const Text(
                      "Login with Google",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "yantramanav",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                          color: Colors.black),
                    )
                  ]),
                ),
              ),
              Flexible(
                  child: Container(
                height: 20,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "Already have an account? ",
                      style: TextStyle(fontFamily: "yantramanav", fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "yantramanav",
                            fontSize: 20),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
