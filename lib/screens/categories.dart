import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '/components/category_list_movies.dart';
import '/utils/colors.dart';
import '/utils/strings.dart';
import '../models/category_movies/all_category_model.dart';
import '../stores/categories_screen/categories_store.dart';

class AllCategories extends StatelessWidget {
  final AllCategoryModel categoryData;

  AllCategories({
    Key? key,
    required this.categoryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataForCategories = context.read<CategoriesStore>();

    return Observer(
      builder: (_) {
        return DefaultTabController(
          initialIndex: categoryData.index,
          length: categoryData.choiceChipsList.length,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              backgroundColor: AppColors.btmNvgColor,
              leading: IconButton(
                onPressed: _dataForCategories.goBack,
                icon: const Icon(
                  Icons.chevron_left,
                  size: 40,
                  color: AppColors.primaryColor,
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.only(left: 70),
                child: Text(
                  AppStrings.txtForAllCategories,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 30,
                  ),
                ),
              ),
              bottom: TabBar(
                isScrollable: true,
                onTap: (index) => _dataForCategories.getCategoryMoviesData(
                  categoryData.choiceChipsList[index].id,
                ),
                indicatorColor: AppColors.primaryColor,
                indicatorWeight: 3,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.white,
                labelStyle: const TextStyle(
                  fontSize: 18,
                ),
                tabs: List.generate(
                  categoryData.choiceChipsList.length,
                  (index) => Tab(
                    child: Text(
                      categoryData.choiceChipsList[index].chipsName,
                    ),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: List.generate(
                categoryData.choiceChipsList.length,
                (_) => Observer(
                  builder: (_) {
                    return CategoryListMovie(
                      displayMovies: _dataForCategories.categoryDataList,
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
