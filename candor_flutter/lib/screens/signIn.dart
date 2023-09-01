import 'package:candor_flutter/utils/colours.dart';
import 'package:candor_flutter/widgets/text_input_field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    height: 150,
                  )),
              Column(
                children: [
                  Container(
                    height: 230,
                    width: 400,
                    padding: const EdgeInsets.all(12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: theYellowColor,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        color: theRedColor,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        alignment: Alignment.center,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          color: theGreenColor,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: primaryColor,
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  'Presenting',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: mobileBackgroundColor,
                                      fontFamily: "Lobster"),
                                ),
                              ),
                              Text(
                                "Candor",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 80,
                                    color: mobileBackgroundColor,
                                    fontFamily: "Lobster"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              TextFieldInput(
                  textEditingController: _emailcontroller,
                  hintText: "Enter your E-Mail Address",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                  textEditingController: _passwordcontroller,
                  hintText: "Enter your password",
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                  
              const SizedBox(
                height: 35,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 23),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: Colors.amber),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
