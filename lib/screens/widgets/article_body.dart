import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/network/network_service.dart';
import 'package:news_app/screens/widgets/news_card.dart';

class ArticleBody extends StatelessWidget {
  final String sourceID;
  const ArticleBody({super.key, required this.sourceID});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkService.gerArticles(sourceID),
      builder: (context, asyncSnapshot) {
        if(asyncSnapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary),);
        } else if(asyncSnapshot.hasError){
          return Center(child: Text(asyncSnapshot.error.toString()),);
        }
        List<Articles> articles= asyncSnapshot.data??[];
        return ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemBuilder: (context, index) => NewsCard(articles: articles[index]),
          separatorBuilder: (context, index) => SizedBox(height: 24.h),
          itemCount: articles.length,
        );
      }
    );
  }
}
