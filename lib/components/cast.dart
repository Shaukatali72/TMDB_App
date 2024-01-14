import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../stores/details_screen/details_screen_store.dart';
import '../utils/asset_images.dart';
import '../utils/colors.dart';
import '../utils/reusable_widgets.dart';
import 'cached_placeholders/placeholder_cast.dart';

class Cast extends StatelessWidget {
  const Cast({super.key});

  @override
  Widget build(BuildContext context) {
    final _dataForDetail = context.read<DetailsPageStore>();

    return SizedBox(
      height: 255,
      child: Observer(
        builder: (_) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _dataForDetail.castList.length,
            itemBuilder: (_, index) {
              final castData = _dataForDetail.castList[index];
              return SizedBox(
                width: 130,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => _dataForDetail.navArgsForCast(
                          castData,
                          index,
                        ),
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Hero(
                              tag: 'cast$index',
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${AppUrl.apiImageLink}${castData.castImage}',
                                placeholder: (_, __) => const PlaceholderCast(),
                                errorWidget: (_, __, ___) {
                                  return const ErrorImageHandler(
                                    dynamicSize: Size(
                                      100,
                                      140,
                                    ),
                                  );
                                },
                                height: 140,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        castData.castName,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
