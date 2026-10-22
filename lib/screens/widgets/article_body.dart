import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/network/network_service.dart';
import 'package:news_app/screens/widgets/error_widget.dart';
import 'package:news_app/screens/widgets/news_card.dart';

class ArticleBody extends StatefulWidget {
  final String sourceID;
  const ArticleBody({super.key, required this.sourceID});

  @override
  State<ArticleBody> createState() => _ArticleBodyState();
}

class _ArticleBodyState extends State<ArticleBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // بنستخدم widget.sourceID للوصول للمتغير من الـ State class
      future: NetworkService.gerArticles(widget.sourceID),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
        }

        if (asyncSnapshot.hasError || asyncSnapshot.data == null) {
          return Center(
            child: CustomErrorWidget(
              errorMessage: "Something went wrong!",
              onRefresh: () {
                setState(() {});
              },
            ),
          );
        }

        final (ErrorModel?, List<Articles>?) response = asyncSnapshot.data!;

        if (response.$1 != null) {
          return Center(
            child: CustomErrorWidget(
              errorMessage: response.$1!.message,
              onRefresh: () {
                // استخدام setState هنا بيخلي الـ FutureBuilder يعيد تشغيل الـ future وجلب البيانات من جديد
                setState(() {});
              },
            ),
          );
        }

        final List<Articles> articles = response.$2 ?? [];

        if (articles.isEmpty) {
          return const Center(child: Text("No articles found"));
        }

        return ListView.separated(
          padding: EdgeInsets.all(16.r),
          itemBuilder: (context, index) => NewsCard(articles: articles[index]),
          separatorBuilder: (context, index) => SizedBox(height: 24.h),
          itemCount: articles.length,
        );
      },
    );
  }
}