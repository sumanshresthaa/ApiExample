import 'package:flutter/material.dart';

import 'view.dart';

void main() {
  runApp(const ApiExample());
}

class ApiExample extends StatelessWidget {
  const ApiExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: ShowData());
  }
}


