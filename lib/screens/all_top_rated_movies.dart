import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/utils/colors.dart';
import '/utils/strings.dart';
import '../components/cached_placeholders/placeholder_vertical.dart';
import '../models/top_rated_movies/top_rated_movies_model.dart';
import '../routes/navigation_service.dart';
import '../stores/home_screen/home_store.dart';
import '../utils/asset_images.dart';
import '../utils/reusable_widgets.dart';

class AllTopRated extends StatelessWidget {
  final List<TopRatedMoviesModel> topRatedData;
  const AllTopRated({
    super.key,
    required this.topRatedData,
  });

  @override
  Widget build(BuildContext context) {
    final _dataForTopRated = context.read<HomePageStore>();

    return Scaffold(
      backgroundColor: AppColors.homePageColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: AppColors.btmNvgColor,
        leading: IconButton(
          onPressed: NavigationService().popIt,
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
            color: AppColors.primaryColor,
          ),
        ),
        title: const Center(
          child: Text(
            AppStrings.txtForAllTopRatedMovies,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 26,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
          ),
          child: Column(
            children: [
              GridView.builder(
                itemCount: topRatedData.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 120 / 200,
                  crossAxisCount: 2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (_, index) {
                  final dataForTopRated = topRatedData[index];
                  return GestureDetector(
                    onTap: () => _dataForTopRated.navArgsForAllTopRated(
                      dataForTopRated,
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
                          tag: 'allTopRated$index',
                          child: CachedNetworkImage(
                            imageUrl:
                                '${AppUrl.apiImageLink}${dataForTopRated.topRatedImage}',
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
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
