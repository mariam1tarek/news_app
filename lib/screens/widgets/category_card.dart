import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/enums/category_enums.dart';
import 'package:news_app/screens/provider/main_screen_provider.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category, required this.isEven});

  final CategoryEnums category;
  final bool isEven;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      width: 1.sw,
      height: 200.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(category.getImage),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(24.r),
        color: Theme.of(context).colorScheme.secondary,
      ),
      alignment: isEven ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            category.name,
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w400,
              color: isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          InkWell(
            onTap: () => Provider.of<MainScreenProvider>(context,listen: false).changeCategory(category),
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: 170.w,
              height: 55.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(84.r),
                color: Colors.grey.withValues(alpha: 0.6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(!isEven)
                    CircleAvatar(
                      radius: 27,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
            
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 9,
                      horizontal: 10,
                    ),
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  if(isEven)
                    CircleAvatar(
                      radius: 27,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}