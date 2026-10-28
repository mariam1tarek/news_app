import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/news/model/models/article_model.dart';
import 'package:news_app/news/view/widgets/error_widget.dart';
import 'package:news_app/news/view/widgets/news_card.dart';
import 'package:news_app/news/view_model/provider/main_screen_provider.dart';
import 'package:provider/provider.dart';

class ArticleBody extends StatefulWidget {
  final String sourceID;
  const ArticleBody({super.key, required this.sourceID});

  @override
  State<ArticleBody> createState() => _ArticleBodyState();
}

class _ArticleBodyState extends State<ArticleBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainScreenProvider>(context, listen: false).getArticles(widget.sourceID);
    });
  }

  @override
  Widget build(BuildContext context) {
    MainScreenProvider provider = context.watch<MainScreenProvider>();

    if (provider.isArticleLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.secondary,
        ),
      );
    }

    if (provider.articlesErrorMessage != null) {
      return Center(
        child: CustomErrorWidget(
          errorMessage: provider.articlesErrorMessage!,
          onRefresh: () {
            provider.getArticles(widget.sourceID);
          },
        ),
      );
    }

    final List<Articles> articles = provider.articles ?? [];

    if (articles.isEmpty) {
      return const Center(child: Text("No articles found"));
    }

    return ListView.separated(
      padding: EdgeInsets.all(16.r),
      itemBuilder: (context, index) => NewsCard(articles: articles[index]),
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
      itemCount: articles.length,
    );
  }
}