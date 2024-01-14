import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../stores/home_screen/home_store.dart';
import '../utils/asset_images.dart';
import '../utils/colors.dart';
import '../utils/reusable_widgets.dart';
import 'cached_placeholders/placeholder_horizontal.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _dataForTrendingMovies = context.read<HomePageStore>();

    return SizedBox(
      height: 250,
      child: Observer(
        builder: (_) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _dataForTrendingMovies.trendingMoviesList.length,
            itemBuilder: (_, index) {
              final trendingData =
                  _dataForTrendingMovies.trendingMoviesList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () => _dataForTrendingMovies.navArgsForTrending(
                    trendingData,
                    index,
                  ),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      side: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Hero(
                        tag: 'trending$index',
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppUrl.apiImageLink}${trendingData.movieImage}',
                          placeholder: (_, __) => const PlaceholderHorizontal(),
                          errorWidget: (_, __, ___) {
                            return const ErrorImageHandler(
                              dynamicSize: Size(
                                300,
                                0,
                              ),
                            );
                          },
                          width: 300,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
