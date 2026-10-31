import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/news/model/models/article_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleDetailsScreen extends StatelessWidget {
  final Articles article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final secondaryTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.source?.name ?? 'News Details',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title ?? '',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.35,
                  color: textColor,
                ),
              ),
              SizedBox(height: 12.h),

              if (article.description != null) ...[
                Text(
                  article.description!,
                  style: TextStyle(
                    fontSize: 15.sp,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: secondaryTextColor,
                  ),
                ),
                SizedBox(height: 16.h),
              ],

              Row(
                children: [
                  Text(
                    'By ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: secondaryTextColor,
                    ),
                  ),
                  Text(
                    article.author ?? 'Unknown Author',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              if (article.publishedAtDate != null)
                Text(
                  timeago.format(article.publishedAtDate!),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: secondaryTextColor,
                  ),
                ),
              SizedBox(height: 16.h),

              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook),
                    color: secondaryTextColor,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                    color: secondaryTextColor,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.email_outlined),
                    color: secondaryTextColor,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.link),
                    color: secondaryTextColor,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              const Divider(),
              SizedBox(height: 12.h),

              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  width: 1.sw,
                  height: 220.h,
                  fit: BoxFit.cover,
                  errorWidget: (context, error, stackTrace) => Container(
                    height: 220.h,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.broken_image_outlined),
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              Text(
                article.source?.name != null
                    ? 'National headlines from ${article.source!.name} - Catch up on developing stories.'
                    : '',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: secondaryTextColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 20.h),

              Text(
                article.content ?? article.description ?? 'No additional content available.',
                style: TextStyle(
                  fontSize: 16.sp,
                  height: 1.65,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}