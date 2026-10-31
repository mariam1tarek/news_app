import 'package:news_app/enums/category_enums.dart';
import 'package:news_app/news/model/models/article_model.dart';
import 'package:news_app/news/model/models/source_model.dart';

abstract class MainLayerState {
  CategoryEnums? categoryEnums;
  MainLayerState({required this.categoryEnums});
}
class MainLayerInitialState extends MainLayerState {
  MainLayerInitialState():super(categoryEnums: null);
}

class SelectCategoryState extends MainLayerState{
  SelectCategoryState({required super.categoryEnums});
}

class GetSourcesLoading extends MainLayerState{
  GetSourcesLoading({required super.categoryEnums, List<Sources>? sources});
}
class GetSourcesSuccess extends MainLayerState{
  final List<Sources> sources;
  GetSourcesSuccess({required super.categoryEnums, required this.sources});
}
class GetSourcesError extends MainLayerState{
  final String errorMessage;
  GetSourcesError({required super.categoryEnums, required this.errorMessage});
}


class GetArticlesLoading extends MainLayerState{
  final List<Sources>?sources;
  GetArticlesLoading({required super.categoryEnums,required this.sources});
}
class GetArticlesSuccess extends MainLayerState{
  final List<Sources>?sources;
  final List<Articles> articles;
  GetArticlesSuccess({required super.categoryEnums, required this.sources, required this.articles});
}
class GetArticlesError extends MainLayerState{
  final List<Sources>?sources;
  final String errorMessage;
  GetArticlesError({required super.categoryEnums,required this.sources, required this.errorMessage});
}
