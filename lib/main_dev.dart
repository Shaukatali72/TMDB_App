import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tmdb/database/database_helper.dart';
import 'package:tmdb/shared_preferences/shared_preferences_instance.dart';

import 'package:tmdb/routes/navigation_service.dart';
import 'package:tmdb/routes/on_generate_route.dart';
import 'package:tmdb/routes/routes.dart';
import 'package:tmdb/flavors/flavor.dart';
import 'package:tmdb/flavors/flavor_config.dart';
import 'package:tmdb/flavors/flavor_values.dart';
import 'package:tmdb/stores/favourites_screen/favourites_store.dart';
import 'package:tmdb/stores/home_screen/home_store.dart';
import 'package:tmdb/stores/profile_screen/profile_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig.init(
    flavor: Flavor.dev,
    values: const FlavorValues(
      apiKey: '491793e7377166aa3e79127c98891c82',
    ),
  );
  SharedPrefs.init();
  await SharedPrefs.getPref();
  DatabaseHelper.init();
  await DatabaseHelper.initialize();
  runApp(const TMDB());
}

class TMDB extends StatelessWidget {
  const TMDB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.top],
      );
    }

    return MultiProvider(
      providers: [
        Provider(create: (_) => FavouritesScreenStore()),
        Provider(create: (_) => ProfileStore()),
        Provider(
          create: (_) => HomePageStore(),
          dispose: (_, value) => value.subscription.cancel(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService().navigationKey,
        onGenerateRoute: GenRoute.generateRoute,
        initialRoute: SharedPrefs.instance!.checkLogin() ? MyRoutes.loginRoute : MyRoutes.landingPageRoute,
      ),
    );
  }
}
