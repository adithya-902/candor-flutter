import 'package:candor_flutter/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 1),
              SvgPicture.asset(
                'assets/logo.svg',
                height: 64,
              ),
              SizedBox(
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
                  textInputType: TextInputType.text),

              const SizedBox(
                height: 40,
              ),

              Container(
                child: Text("Login"),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 23),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4)
                    ),
                  ),
                  color: Colors.amber
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(child: Container(), flex: 1,)
            ],
          ),
        ),
        
      ),
    );
  }
}
