import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRefresh,
  });
  final String errorMessage;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorMessage,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        FilledButton.icon(onPressed: onRefresh, label: Text('Refresh',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),icon: Icon(Icons.refresh),)
      ],
    );
  }
}
