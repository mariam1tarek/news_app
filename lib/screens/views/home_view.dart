import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/enums/category_enums.dart';
import 'package:news_app/screens/widgets/category_card.dart';


class HomeView extends StatelessWidget {
  const HomeView ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.r),
      children: [
        Text(
          "Good Morning\nHere is Some News For You.",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
        ),
        ...List.generate(
          CategoryEnums.values.length,
          ((index) => CategoryCard(
            category: CategoryEnums.values[index],
            isEven: index % 2 == 0,
          )),
        ),
      ],
    );
  }
}
