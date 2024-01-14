import '../flavors/flavor_config.dart';

class AppStrings {
  static const txtForEmailUsernameForLabelAndHint = 'Enter Email';
  static const txtForPasswordForLabelAndHint = 'Password';
  static const txtForPasswordForReEnter = 'Re-Enter Password';
  static const txtForNewPassword = 'New Password';
  static const txtForConfirmNewPassword = 'Confirm New Password';
  static const txtForLoginBtn = 'LOGIN';
  static const txtForSignUpBtn = 'SIGN UP';
  static const txtForValidationOfUsernameEmpty =
      'Username or Email cannot be empty';
  static const txtForValidationOfPassEmpty = 'Password cannot be empty';
  static const txtForValidationOfPassLength =
      'Password length must be more than 6 characters';
  static const txtForWelcomeTo = 'Welcome To';
  static const txtForCreative = 'Creative';
  static const txtForPleaseLoginToContinue = 'Please Login To Continue';
  static const txtForForgotPassword = 'FORGOT PASSWORD?';
  static const txtForOr = 'OR';
  static const txtForExistingUser = 'Existing User ?';
  static const txtForSignUpWith = 'Sign Up with';
  static const txtForOrSignUpWith = 'Or SignUp with';
  static const txtForSnackBarOfFacebook = 'Logged in to Facebook';
  static const txtForSnackBarOfGoogle = 'Logged in to Google';
  static const txtForSendOtpBtn = 'Send OTP';
  static const txtForEnterOtp = 'Enter Your OTP code here';
  static const txtForResetPasswordBtn = 'Reset Password';
  static const txtForResetPassword = 'RESET PASSWORD';
  static const txtForVerifyOtpBtn = 'Verify OTP';
  static const txtForVerifyEmailAddress = 'Verify your Email address';
  static const txtForAboutUs = 'About Us';
  static const txtForActor = 'Actor';
  static const txtForBiography = 'Biography';
  static const txtForFavourites = 'Favourites';

  static const regExForEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const regExForLowerCase = r'[a-z]';
  static const regExForUpperCase = r'[A-Z]';
  static const regExForNumber = r'[0-9]';
  static const regExForSpecial = r'[!@#$%^&*(),.?":{}|<>]';

  static const errorMessageForEmail = 'Enter Proper Email Format';
  static const errorMessageForUpperCase = 'Atleast 1 word should be capital';
  static const errorMessageForLowerCase = 'Atleast 1 word should be lowercase';
  static const errorMessageForNumber = 'Password must have 1 number';
  static const errorMessageForSpecial =
      'Password must have 1 special character';
  static const errorMessageForPasswordDidNotMatch = 'Password did not match';

  static const txtForHPTrendingMovies = 'Trending Movies';
  static const txtForCategory = 'Category';
  static const txtForTopRated = 'Top Rated';
  static const txtForDetailsPageTrailer = 'Trailer';
  static const txtForHomeTrailers = 'Trailers';
  static const txtForCast = 'Cast';

  static const txtForBtnPlayNow = 'Play Now';

  static const txtForErrorRoute = 'Error Routing!';

  static const txtForLogoutAlert = 'Logout?';
  static const txtForRemoveFavourites = 'Remove?';
  static const txtForYes = 'Yes';
  static const txtForNo = 'No';
  static const txtForAll = 'All';
  static const txtForSeeAll = 'See All';

  static const txtForAllTopRatedMovies = 'All Top Rated Movies';
  static const txtForAllCategories = 'Categories';

  static const txtforLogout = 'Logout';

  static const txtForProfileName = 'Shaukatali Momin';
  static const txtForProfileEmail = 'mominshaukatali@gmail.com';

  static const txtForAddFavourites = 'Add Your Favourites Here!';
  static const txtForTMDBApp = 'TMDB App';
  static const txtForVersion = 'Version 1.0.0';
  static const txtForTrademark = '© 2008-2023 TMDB Inc.';

  static final api_key = '${FlavorConfig.apiKey}';
  static const txtForUpcomingMovies = 'Upcoming Movies';
  static const txtForMovieImages = 'Movie Images';
  static const txtForMovieTrailers = 'Movie Trailers';
  static const txtForRecommended = 'Recommended';
  static const txtForNoData = 'No Data Found!';
  static const txtForSearchMovies = 'Search Movies...';
  static const txtForNoCaseFound = 'No Case Found!';
  static const blankString = '';
  static const txtForCouldNotLaunchUrl = 'Could not launch';
  static const txtForNoInternet = 'No Internet Connection!';
  static const txtForConnectedToInternet = 'Connected to Internet';
  static const txtForSomethingWentWrong = 'Something went wrong';
  static const txtForConnectingToServer = 'Connecting to server...';
  static const txtForSlowInternetConnection = 'Slow internet connection';
  static const txtForServerDown = 'Server Down!';
  static const txtForInvalidApiKey = 'Invalid Api Key!';
  static const txtForNoMovieFound = 'No Movie Found!';
  static const txtForServiceNotAvailable = 'Service not available';
  static const txtForTryAgain = 'Try Again Later...';
  static const txtForRequestCanceled = 'Request cancelled';
  static const txtForServiceBlocked = 'Service is blocked';
  static const txtForRetry = 'Retry';

  static const txtForUatFlavor = 'UAT Flavor';
  static const txtForDevFlavor = 'Dev Flavor';
  static const txtForProdFlavor = 'Prod Flavor';
}
