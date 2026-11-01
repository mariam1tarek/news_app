import 'package:news_app/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news/view/search/search_screen.dart';
import 'package:news_app/news/view/views/home_view.dart';
import 'package:news_app/news/view/views/news_details_view.dart';
import 'package:news_app/news/view/widgets/drawer_widget.dart';
import 'package:news_app/news/view_model/provider/main_screen_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainScreenProvider(),
      child: Consumer<MainScreenProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            drawer: DrawerWidget(),
            appBar: AppBar(
              title: Text(
                provider.categoryEnum == null
                    ? context.tr('home')
                    : context.categoryName(provider.categoryEnum!),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SearchScreen(
                        repository: provider.searchRepository,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: provider.categoryEnum == null
                ? HomeView()
                : NewsDetailsView(key: ValueKey(provider.categoryEnum)),
          );
        },
      ),
    );
  }
}