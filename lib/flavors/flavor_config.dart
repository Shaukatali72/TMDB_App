import 'package:tmdb/flavors/flavor.dart';
import 'package:tmdb/flavors/flavor_values.dart';

class FlavorConfig {
  final Flavor _flavor;
  final FlavorValues _values;

  FlavorConfig._({
    required Flavor flavor,
    required FlavorValues values,
  })  : _flavor = flavor,
        _values = values;

  static FlavorConfig? _instance;

  static bool get isDev => _instance!._flavor == Flavor.dev;
  static bool get isProd => _instance!._flavor == Flavor.prod;
  static String get apiKey => _instance!._values.apiKey;

  static void init({
    required Flavor flavor,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._(
      flavor: flavor,
      values: values,
    );
  }
}
