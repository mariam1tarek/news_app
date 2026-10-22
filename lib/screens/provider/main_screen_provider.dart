import 'package:flutter/material.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/enums/category_enums.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/network/network_service.dart';

class MainScreenProvider extends ChangeNotifier{
  CategoryEnums? categoryEnum;
  List<Sources>? sources;
  bool isSourcesLoading=false;
  String? sourcesErrorMessage;
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
        //TODO:handel error
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
}