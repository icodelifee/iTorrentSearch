import 'package:flutter/material.dart';

import '../widgets/header_elements.dart';
import '../widgets/popular_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: const [
              Expanded(flex: 0, child: HeaderElements()),
              Expanded(child: PopularList()),
            ],
          ),
        ),
      ),
    );
  }
}
