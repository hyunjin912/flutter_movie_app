import 'package:flutter/material.dart';

class GlobalScaffold extends StatelessWidget {
  final List<Widget> children;

  const GlobalScaffold({super.key, required this.children});

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
