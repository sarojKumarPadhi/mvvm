import 'package:flutter/material.dart';
import 'package:mvvm/utils/utiles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Utils.flushBarErrorMessage('hello world', context);
        },
        child: const Center(
          child: Text("it is home page"),
        ),
      ),
    );
  }
}
