import 'package:flutter/material.dart';
import 'package:news_app/enums/category_enums.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/network/network_service.dart';

class MainScreenProvider extends ChangeNotifier{
  CategoryEnums? categoryEnum;
  List<Sources>? sources;
  bool isSourcesLoading=false;
  void changeCategory(CategoryEnums? newCategory){
    categoryEnum= newCategory;
    notifyListeners();
  }
  getSources()async{
    isSourcesLoading=true;
    notifyListeners();
    if(categoryEnum!=null){
      List<Sources>? response= await NetworkService.getSources(categoryEnum!.name);
      print('--->> ${response?.length}');
      sources=response;
      notifyListeners();
    }
    isSourcesLoading=false;
    notifyListeners();
  }
}