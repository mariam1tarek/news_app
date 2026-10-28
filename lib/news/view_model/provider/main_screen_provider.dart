import 'package:flutter/material.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/enums/category_enums.dart';
import 'package:news_app/news/model/models/article_model.dart';
import 'package:news_app/news/model/models/source_model.dart';
import 'package:news_app/news/model/network/network_service.dart';

class MainScreenProvider extends ChangeNotifier{
  CategoryEnums? categoryEnum;
  List<Sources>? sources;
  bool isSourcesLoading=false;
  String? sourcesErrorMessage;

  List<Articles>? articles;
  bool isArticleLoading=false;
  String? articlesErrorMessage;

  void changeCategory(CategoryEnums? newCategory){
    categoryEnum= newCategory;
    notifyListeners();
  }
  getSources()async{
    sourcesErrorMessage=null;
    isSourcesLoading=true;
    notifyListeners();
    if(categoryEnum!=null){
      (ErrorModel?,List<Sources>?) response= await NetworkService.getSources(categoryEnum!.name);
      if(response.$1!=null){
        sourcesErrorMessage=response.$1!.message;
      } else if (response.$2!= null){
        print('--->> ${response?.$2!.length}');
        sources=response.$2;
      }

      notifyListeners();
    }
    isSourcesLoading=false;
    notifyListeners();
  }

  Future<void> getArticles(String sourceId)async{
    articlesErrorMessage=null;
    isArticleLoading=true;
    notifyListeners();
    if(categoryEnum!=null){
      (ErrorModel?,List<Articles>?) response= await NetworkService.gerArticles(sourceId);
      if(response.$1!=null){
        //TODO:handel error
        articlesErrorMessage=response.$1!.message;
      } else if (response.$2!= null){
        print('--->> ${response?.$2!.length}');
        articles=response.$2;
      }

      notifyListeners();
    }
    isArticleLoading=false;
    notifyListeners();
  }

}