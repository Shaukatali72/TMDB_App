import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/utils/asset_images.dart';
import '/utils/colors.dart';
import '/utils/strings.dart';
import '../components/cached_placeholders/placeholder_cast.dart';
import '../database/database_helper.dart';
import '../stores/favourites_screen/favourites_store.dart';
import '../utils/reusable_widgets.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final _dataForFavourites = context.read<FavouritesScreenStore>();
    _dataForFavourites.getDataFromDatabase();
    return Scaffold(
      backgroundColor: AppColors.homePageColor,
      appBar: AppBar(
        titleSpacing: 130,
        automaticallyImplyLeading: false,
        title: const Text(
          AppStrings.txtForFavourites,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 30,
          ),
        ),
        toolbarHeight: 70,
        backgroundColor: AppColors.homePageColor,
        elevation: 20,
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          itemCount: _dataForFavourites.databaseList.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => _dataForFavourites.navArgsForDetails(index),
              child: Column(
                children: [
                  Hero(
                    tag: 'favList$index',
                    child: Card(
                      color: AppColors.btmNvgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(17),
                              child: SizedBox(
                                height: 120,
                                width: 95,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${AppUrl.apiImageLink}${_dataForFavourites.databaseList[index][DatabaseHelper.movieImage]}',
                                  placeholder: (_, __) =>
                                      const PlaceholderCast(),
                                  errorWidget: (_, __, ___) {
                                    return const ErrorImageHandler(
                                      dynamicSize: Size(
                                        10,
                                        10,
                                      ),
                                    );
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _dataForFavourites.databaseList[index]
                                          [DatabaseHelper.movieName],
                                      // context
                                      //     .watch<FavouritesScreenStore>()
                                      //     .favouritesList[index]
                                      //     .title,
                                      style: const TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.iconForStar,
                                          height: 18,
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.primaryColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          _dataForFavourites.databaseList[index]
                                                  [DatabaseHelper.movieRating]
                                              .toString(),
                                          // context
                                          //     .watch<FavouritesScreenStore>()
                                          //     .favouritesList[index]
                                          //     .rating
                                          //     .toString(),
                                          style: const TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      _dataForFavourites.databaseList[index]
                                          [DatabaseHelper.movieDescription],
                                      // context
                                      //     .watch<FavouritesScreenStore>()
                                      //     .favouritesList[index]
                                      //     .desc,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 105),
                              child: SizedBox(
                                height: 38,
                                width: 55,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        _dataForFavourites.alertForFavourites(
                                      context,
                                      index,
                                    ),
                                    child: const Icon(
                                      Icons.horizontal_rule,
                                      size: 25,
                                      textDirection: TextDirection.ltr,
                                      color: AppColors.black,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
