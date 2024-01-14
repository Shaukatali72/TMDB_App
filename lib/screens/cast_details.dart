import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '/utils/asset_images.dart';
import '/utils/colors.dart';
import '/utils/strings.dart';
import '../components/cached_placeholders/placeholder_cast.dart';
import '../models/cast/cast_model.dart';
import '../routes/navigation_service.dart';
import '../stores/cast_details_screen/cast_details_store.dart';
import '../utils/reusable_widgets.dart';

class CastDetails extends StatelessWidget {
  final CastModel castArgs;

  const CastDetails({
    super.key,
    required this.castArgs,
  });

  @override
  Widget build(BuildContext context) {
    final _dataForCastDetails = context.read<CastDetailsStore>();

    return Scaffold(
      backgroundColor: AppColors.homePageColor,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: NavigationService().popIt,
          icon: const Icon(
            Icons.chevron_left,
            size: 60,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: '${AppUrl.apiImageLink}${castArgs.castMovieImage}',
            errorWidget: (_, __, ___) {
              return const ErrorImageHandler(
                dynamicSize: Size(
                  100,
                  100,
                ),
              );
            },
            fit: BoxFit.cover,
          ),
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.white,
                  AppColors.white.withOpacity(0.0),
                  AppColors.white.withOpacity(0.0),
                ],
                stops: const [
                  0.2,
                  0.4,
                  0.0,
                ],
              ).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.homePageColor,
                    AppColors.homePageColor,
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 200,
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        const BoxShadow(
                          color: AppColors.homePageColor,
                          spreadRadius: 20,
                          blurRadius: 25,
                        ),
                      ],
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(
                        tag: castArgs.hero!,
                        child: CachedNetworkImage(
                          imageUrl:
                              '${AppUrl.apiImageLink}${castArgs.castImage}',
                          placeholder: (_, __) => const PlaceholderCast(),
                          errorWidget: (_, __, ___) {
                            return const ErrorImageHandler(
                              dynamicSize: Size(
                                130,
                                200,
                              ),
                            );
                          },
                          height: 200,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    castArgs.castName,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                    ),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      _dataForCastDetails.bioData.department,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                    );
                  }),
                  const SizedBox(height: 40),
                  const Text(
                    AppStrings.txtForBiography,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    children: [
                      Observer(
                        builder: (_) {
                          return Text(
                            _dataForCastDetails.bioData.castBio.isEmpty
                                ? AppStrings.txtForNoData
                                : _dataForCastDetails.bioData.castBio,
                            maxLines: 40,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
