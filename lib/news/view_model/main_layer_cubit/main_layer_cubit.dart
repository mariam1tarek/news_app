import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/error/error_model.dart';
import 'package:news_app/enums/category_enums.dart';
import 'package:news_app/news/model/models/article_model.dart';
import 'package:news_app/news/model/models/source_model.dart';
import 'package:news_app/news/model/network/network_service.dart';
import 'package:news_app/news/view_model/main_layer_cubit/main_layer_state.dart';

class MainLayerCubit extends Cubit<MainLayerState> {
  MainLayerCubit() : super(MainLayerInitialState());

  final NetworkService networkService = NetworkService();

  List<Sources>? sources;
  CategoryEnums? selectedCategory;

  Future<void> selectCategory(CategoryEnums newCategory) async {
    emit(SelectCategoryState(categoryEnums: newCategory));
    await getSources(newCategory);
  }

  Future<void> getSources(CategoryEnums category) async {
    selectedCategory = category;
    emit(GetSourcesLoading(categoryEnums: category));

    (ErrorModel?, List<Sources>?) result = await networkService.getSources(
      category.name,
    );

    if (result.$1 != null) {
      emit(
        GetSourcesError(
          categoryEnums: category,
          errorMessage: result.$1!.message,
        ),
      );
    } else {
      sources = result.$2;
      emit(GetSourcesSuccess(categoryEnums: category, sources: result.$2!));
    }
  }

  Future<void> getArticles(String sourceId) async {
    emit(GetArticlesLoading(
      categoryEnums: selectedCategory,
      sources: sources,
    ));

    (ErrorModel?, List<Articles>?) result = await networkService.gerArticles(
      sourceId,
    );

    if (result.$1 != null) {
      emit(
        GetArticlesError(
          categoryEnums: selectedCategory,
          sources: sources,
          errorMessage: result.$1!.message,
        ),
      );
    } else {
      emit(
        GetArticlesSuccess(
          categoryEnums: selectedCategory,
          sources: sources ?? [],
          articles: result.$2 ?? [],
        ),
      );
    }
  }
}