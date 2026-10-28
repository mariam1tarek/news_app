import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/enums/category_enums.dart';
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
                    ? "Home"
                    : provider.categoryEnum!.name,
              ),
              actions: const [Icon(Icons.search)],
            ),
            body: provider.categoryEnum == null ? HomeView() : NewsDetailsView(),
          );
        },
      ),
    );
  }
}