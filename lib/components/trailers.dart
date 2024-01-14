import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '/utils/colors.dart';
import '../stores/details_screen/details_screen_store.dart';
import '../utils/asset_images.dart';

class MovieTrailers extends StatelessWidget {
  const MovieTrailers({super.key});

  @override
  Widget build(BuildContext context) {
    final _dataForTrailer = context.read<DetailsPageStore>();

    return SizedBox(
      height: 250,
      child: Observer(
        builder: (_) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _dataForTrailer.movieTrailersList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    child: Stack(
                      children: [
                        Image.network(
                          AppUrl.movieTrailerImage,
                          height: 300,
                          width: 300,
                          fit: BoxFit.cover,
                          color: AppColors.homePageColor.withOpacity(0.5),
                          colorBlendMode: BlendMode.darken,
                        ),
                        Positioned(
                          left: 110,
                          top: 80,
                          child: IconButton(
                            onPressed: () => _dataForTrailer.showMovie(index),
                            icon: const Icon(
                              Icons.play_arrow_rounded,
                              size: 70,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
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
