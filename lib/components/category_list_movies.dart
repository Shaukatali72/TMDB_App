import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/utils/colors.dart';
import '../models/category_movies/category_movies_model.dart';
import '../stores/home_screen/home_store.dart';
import '../utils/asset_images.dart';
import '../utils/reusable_widgets.dart';
import 'cached_placeholders/placeholder_vertical.dart';

class CategoryListMovie extends StatelessWidget {
  final List<CategoryMoviesModel> displayMovies;

  const CategoryListMovie({
    super.key,
    required this.displayMovies,
  });

  @override
  Widget build(BuildContext context) {
    final _dataForAllCategory = context.read<HomePageStore>();

    return ColoredBox(
      color: AppColors.homePageColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 30,
        ),
        child: Column(
          children: [
            GridView.builder(
              itemCount: displayMovies.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 120 / 200,
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (_, index) {
                final categoryListData = displayMovies[index];
                return GestureDetector(
                  onTap: () => _dataForAllCategory.navArgsForCategoryList(
                    categoryListData,
                    index,
                  ),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      side: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(
                        tag: 'categories$index',
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppUrl.apiImageLink}${categoryListData.backgroundImage}',
                          placeholder: (_, __) => const PlaceholderVertical(),
                          errorWidget: (_, __, ___) {
                            return const ErrorImageHandler(
                              dynamicSize: Size(
                                100,
                                100,
                              ),
                            );
                          },
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
