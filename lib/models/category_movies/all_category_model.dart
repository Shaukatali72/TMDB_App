import '../choice_chips/choice_chips_model.dart';
import 'category_movies_model.dart';

class AllCategoryModel {
  final int index;
  late final List<CategoryMoviesModel> categoriesMovieList;
  final List<ChoiceChipsModel> choiceChipsList;

  AllCategoryModel({
    required this.index,
    required this.categoriesMovieList,
    required this.choiceChipsList,
  });
}
