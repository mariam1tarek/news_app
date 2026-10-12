import 'package:flutter/material.dart';
import 'package:news_app/screens/widgets/drawer_widget.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          "Home",
        ),
       actions: [Icon(Icons.search),],
      ),
    );
  }
}
