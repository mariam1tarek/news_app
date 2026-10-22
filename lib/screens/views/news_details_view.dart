import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/provider/main_screen_provider.dart';
import 'package:news_app/screens/widgets/article_body.dart';
import 'package:news_app/screens/widgets/error_widget.dart';
import 'package:provider/provider.dart';

class NewsDetailsView extends StatefulWidget {
  const NewsDetailsView({super.key});

  @override
  State<NewsDetailsView> createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MainScreenProvider>(context, listen: false).getSources();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Consumer<MainScreenProvider>(
      builder: (BuildContext context, MainScreenProvider provider, Widget? child) {
        if (provider.isSourcesLoading) {
          return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,));
        }
        if(provider.sourcesErrorMessage != null){
          return Center(
            child: CustomErrorWidget(
              errorMessage: provider.sourcesErrorMessage!,
              onRefresh: () {
                Provider.of<MainScreenProvider>(context, listen: false).getSources();
              },
            ),
          );
        }
        if ((provider.sources ?? []).isNotEmpty) {
          return DefaultTabController(
            length: provider.sources!.length,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelColor: textColor,
                  unselectedLabelColor: textColor.withValues(alpha: 0.6),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerHeight: 0,
                  tabs: provider.sources!
                      .map((e) => Tab(text: e.name ?? ''))
                      .toList(),
                ),
                Expanded(
                  child: TabBarView(
                    children: List.generate(
                      provider.sources!.length,
                          (index) => ArticleBody(
                        sourceID: provider.sources![index].id ?? "",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: Text("No data found"));
      },
    );
  }
}