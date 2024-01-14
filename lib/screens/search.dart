import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '/utils/colors.dart';
import '/utils/strings.dart';
import '../components/cached_placeholders/placeholder_vertical.dart';
import '../stores/search_screen/search_movies_store.dart';
import '../utils/asset_images.dart';
import '../utils/reusable_widgets.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataForSearch = context.read<SearchMoviesStore>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.homePageColor,
      body: Column(
        children: [
          Center(
            child: SizedBox(
              height: 120,
              child: Container(
                padding: const EdgeInsets.only(top: 70),
                child: SizedBox(
                  width: 370,
                  child: TextField(
                    autofocus: false,
                    onChanged: (value) => _dataForSearch.searchMovies(value),
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.search,
                        color: AppColors.primaryColor,
                      ),
                      hintText: AppStrings.txtForSearchMovies,
                      hintStyle: const TextStyle(
                        color: AppColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: AppColors.btmNvgColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.only(left: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                if (_dataForSearch.searchError.isEmpty) {
                  return Observer(
                    builder: (_) {
                      return GridView.builder(
                        padding: const EdgeInsets.all(40),
                        itemCount: _dataForSearch.searchMoviesList.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 120 / 200,
                          crossAxisCount: 2,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (_, index) {
                          final searchData =
                              _dataForSearch.searchMoviesList[index];
                          return GestureDetector(
                            onTap: () => _dataForSearch.navArgsForSearch(
                              searchData,
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
                                  tag: 'search$index',
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${AppUrl.apiImageLink}${searchData.searchImage}',
                                    placeholder: (_, __) =>
                                        const PlaceholderVertical(),
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
                      );
                    },
                  );
                } else {
                  return ErrorMessage(
                    errorData: _dataForSearch.searchError,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
