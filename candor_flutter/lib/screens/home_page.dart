import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void signUserOut() async {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.signOut();
    await user?.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text("Logged in!!!"),
      ),
    );
  }
}
