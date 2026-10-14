
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/enums/category_enums.dart';
import 'package:news_app/screens/widgets/drawer_widget.dart';
import 'package:news_app/screens/widgets/category_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: const Text("Home"),
        actions: [Icon(Icons.search)],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Text(
            "Good Morning\nHere is Some News For You.",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          ...List.generate(CategoryEnums.values.length, ((index) => CategoryCard(category: CategoryEnums.values[index], isEven: index%2==0)))
        ],
      ),
    );
  }
}
