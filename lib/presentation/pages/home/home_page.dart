import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/widgets/global_scaffold.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/home_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(children: [HomeScaffold()]);
  }
}
