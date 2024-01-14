import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tmdb/routes/routes.dart';
import 'package:tmdb/screens/all_top_rated_movies.dart';
import 'package:tmdb/screens/categories.dart';
import 'package:tmdb/screens/landing_page.dart';
import 'package:tmdb/screens/login.dart';
import 'package:tmdb/screens/signup.dart';
import 'package:tmdb/utils/strings.dart';
import 'package:tmdb/models/cast/cast_model.dart';
import 'package:tmdb/models/category_movies/all_category_model.dart';
import 'package:tmdb/models/movie_arguments/movie_arguments_model.dart';
import 'package:tmdb/models/top_rated_movies/top_rated_movies_model.dart';
import 'package:tmdb/screens/about_us.dart';
import 'package:tmdb/screens/cast_details.dart';
import 'package:tmdb/screens/details_page.dart';
import 'package:tmdb/screens/forgot_password.dart';
import 'package:tmdb/screens/otp_verification.dart';
import 'package:tmdb/screens/reset_password.dart';
import 'package:tmdb/stores/cast_details_screen/cast_details_store.dart';
import 'package:tmdb/stores/categories_screen/categories_store.dart';
import 'package:tmdb/stores/details_screen/details_screen_store.dart';
import 'package:tmdb/stores/forgot_password_screen/forgot_password_store.dart';
import 'package:tmdb/stores/home_screen/home_store.dart';
import 'package:tmdb/stores/landing_page_screen/landing_page_store.dart';
import 'package:tmdb/stores/login_screen/login_store.dart';
import 'package:tmdb/stores/otp_verification_screen/otp_verification_store.dart';
import 'package:tmdb/stores/reset_password_screen/reset_password_store.dart';
import 'package:tmdb/stores/signup_screen/signup_store.dart';

class GenRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case MyRoutes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => LoginStore(),
            child: const Login(),
          ),
        );

      case MyRoutes.signUpRoute:
        return MaterialPageRoute(
          builder: (context) => Provider(
            create: (_) => SignUpStore(context),
            child: const SignUp(),
          ),
        );

      case MyRoutes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => ForgotPasswordStore(),
            child: const ForgotPassword(),
          ),
        );

      case MyRoutes.otpVerificationRoute:
        return MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => OtpVerificationStore(),
            child: const OtpVerification(),
          ),
        );

      case MyRoutes.resetPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => ResetPasswordStore(),
            child: const ResetPassword(),
          ),
        );

      case MyRoutes.landingPageRoute:
        return MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => LandingPageStore(),
            child: const LandingPage(),
          ),
        );

      case MyRoutes.allCategoriesRoute:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              Provider(
                create: (_) => CategoriesStore(categoryData: args as AllCategoryModel),
              ),
              Provider(
                create: (_) => HomePageStore(),
              ),
            ],
            child: AllCategories(categoryData: args as AllCategoryModel),
          ),
        );

      case MyRoutes.allTopRatedRoute:
        return MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => HomePageStore(),
            child: AllTopRated(topRatedData: args as List<TopRatedMoviesModel>),
          ),
        );

      case MyRoutes.detailsPageRoute:
        return MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => DetailsPageStore(movieIdData: args),
            child: DetailsPage(movieArgs: args as MovieArguments),
          ),
        );

      case MyRoutes.castDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => CastDetailsStore(castData: args),
            child: CastDetails(castArgs: args as CastModel),
          ),
        );

      case MyRoutes.aboutUsRoute:
        return MaterialPageRoute(
          builder: (_) => const AboutUs(),
        );

      default:
        return errorMessage();
    }
  }

  static Route<dynamic> errorMessage() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text(
            AppStrings.txtForErrorRoute,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
