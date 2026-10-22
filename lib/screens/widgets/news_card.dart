import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/app_colors.dart';
import 'package:news_app/models/article_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          SizedBox(
            width: 1.sw,
            height: 220.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child:CachedNetworkImage(
                imageUrl: articles.urlToImage ?? '',
                fit: BoxFit.cover,
                errorWidget: (context,error,stackTrace) => Center(child: Icon(Icons.broken_image_outlined,color: Theme.of(context).colorScheme.secondary)),
                progressIndicatorBuilder: (context,child,loadingProgress)=> Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary)),
              ),
            ),
          ),
          Text(
            articles.title ?? '',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          Row(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (articles.author != null)
                Expanded(
                  child: Text(
                    'by: ${articles.author}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
              if (articles.publishedAtDate != null)
                Text(
                  timeago.format(articles.publishedAtDate!),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyColor,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}