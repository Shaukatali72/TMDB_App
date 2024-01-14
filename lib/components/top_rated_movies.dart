import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../stores/home_screen/home_store.dart';
import '../utils/asset_images.dart';
import '../utils/colors.dart';
import '../utils/reusable_widgets.dart';
import 'cached_placeholders/placeholder_vertical.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final _dataForTopRatedMovies = context.read<HomePageStore>();

    return SizedBox(
      height: 300,
      child: Observer(
        builder: (_) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _dataForTopRatedMovies.topRatedMoviesList.length,
            itemBuilder: (_, index) {
              final topRatedData =
                  _dataForTopRatedMovies.topRatedMoviesList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GestureDetector(
                  onTap: () => _dataForTopRatedMovies.navArgsForTopRated(
                    topRatedData,
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
                      child: Column(
                        children: [
                          Hero(
                            tag: 'topRated$index',
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${AppUrl.apiImageLink}${topRatedData.topRatedImage}',
                              placeholder: (_, __) =>
                                  const PlaceholderVertical(),
                              errorWidget: (_, __, ___) {
                                return const ErrorImageHandler(
                                  dynamicSize: Size(
                                    170,
                                    292,
                                  ),
                                );
                              },
                              height: 292,
                              width: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
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
