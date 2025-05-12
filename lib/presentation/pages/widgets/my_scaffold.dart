import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final List<Widget> children;

  const MyScaffold({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devicePadding = MediaQuery.of(context).padding;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
          top: devicePadding.top,
          bottom: devicePadding.bottom,
        ),
        children: children,
      ),
    );
  }
}
