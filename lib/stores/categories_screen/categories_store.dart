import 'package:mobx/mobx.dart';

import '/routes/navigation_service.dart';
import '../../../api_services/repository.dart';
import '../../../models/category_movies/all_category_model.dart';
import '../../../models/category_movies/category_movies_model.dart';

part 'categories_store.g.dart';

class CategoriesStore = _CategoriesStore with _$CategoriesStore;

abstract class _CategoriesStore with Store {
  final AllCategoryModel categoryData;

  _CategoriesStore({required this.categoryData}) {
    categoryDataList = categoryData.categoriesMovieList;
  }

  void goBack() {
    NavigationService().popIt();
  }

  @observable
  List<CategoryMoviesModel> categoryDataList = [];

  Future<void> getCategoryMoviesData(int genreId) async {
    final result = await Repository().fetchCategoryMoviesData(
      withGenres: genreId,
      pageNumber: 9,
      isAdult: false,
    );
    if (result.isEmpty) {
      categoryDataList = [];
    } else {
      categoryDataList = result;
    }
  }
}
