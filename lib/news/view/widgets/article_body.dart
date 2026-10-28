import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/news/model/models/article_model.dart';
import 'package:news_app/news/view/widgets/error_widget.dart';
import 'package:news_app/news/view/widgets/news_card.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_cubit.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_state.dart';

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
      context.read<MainLayerCubit>().getArticles(widget.sourceID);
    });
  }

  @override
  void didUpdateWidget(covariant ArticleBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sourceID != widget.sourceID) {
      context.read<MainLayerCubit>().getArticles(widget.sourceID);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayerCubit, MainLayerState>(
      builder: (context, state) {
        if (state is GetArticlesLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
        } else if (state is GetArticlesError) {
          return Center(
            child: CustomErrorWidget(
              errorMessage: state.errorMessage,
              onRefresh: () {
                context.read<MainLayerCubit>().getArticles(widget.sourceID);
              },
            ),
          );
        } else if (state is GetArticlesSuccess) {
          final List<Articles> articles = state.articles ?? [];

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

        return const SizedBox();
      },
    );
  }
}