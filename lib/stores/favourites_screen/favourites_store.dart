import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '/routes/navigation_service.dart';
import '../../database/database_helper.dart';
import '../../models/movie_arguments/movie_arguments_model.dart';
import '../../routes/routes.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';

part 'favourites_store.g.dart';

class FavouritesScreenStore = _FavouritesStore with _$FavouritesScreenStore;

abstract class _FavouritesStore with Store {
  // ObservableList favouritesList = ObservableList.of([]);
  // ObservableList favouritesListIndex = ObservableList.of([]);

  // _FavouritesStore() {
  //   getDataFromDatabase();
  // }

  ObservableList databaseList = ObservableList.of([]);

  @observable
  bool isFavourite = false;

  Future<bool> isContain(String movieName) {
    // return favouritesListIndex.contains(movieName);
    return DatabaseHelper.contains(movieName);
  }

  void addToFav(MovieArguments value) async {
    // favouritesList.add(value);
    // favouritesListIndex.add(movieName);

    Map<String, dynamic> row = {
      DatabaseHelper.movieImage: value.url,
      DatabaseHelper.movieName: value.title,
      DatabaseHelper.movieRating: value.rating,
      DatabaseHelper.movieDescription: value.desc,
    };
    isFavourite = true;
    final id = await DatabaseHelper.insertData(row);
    debugPrint('inserted row id: $id');
  }

  void removeFromFav(String movieName) async {
    // favouritesList.removeAt(favouritesListIndex.indexOf(movieName));
    // favouritesListIndex.remove(movieName);

    isFavourite = false;
    //final id = await DatabaseHelper.queryRowCount();
    final rowsDeleted = await DatabaseHelper.deleteData(movieName);
    getDataFromDatabase();
    debugPrint('deleted $rowsDeleted');
  }

  Future<void> getDataFromDatabase() async {
    print("add called");
    databaseList.clear();
    databaseList.addAll(await DatabaseHelper.getData());
  }

  void navArgsForDetails(int index) {
    final searchData = databaseList[index];
    NavigationService().navigateToScreen(
      MyRoutes.detailsPageRoute,
      navArgs: MovieArguments(
        url: searchData[DatabaseHelper.movieImage],
        title: searchData[DatabaseHelper.movieName],
        desc: searchData[DatabaseHelper.movieDescription],
        rating: double.parse(searchData[DatabaseHelper.movieRating]),
        hero: 'favList$index',
        movieId: searchData[DatabaseHelper.movieId],
      ),
    );
  }

  void funcForRemove(int index) {
    removeFromFav(
      databaseList[index][DatabaseHelper.movieName],
    );
  }

  void isOnClicked(MovieArguments movieArgs) async {
    {
      if (await isContain(movieArgs.title)) {
        removeFromFav(movieArgs.title);
      } else {
        addToFav(movieArgs);
      }
    }
  }

  void alertForFavourites(
    favContext,
    int index,
  ) {
    showDialog(
      context: favContext,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColors.btmNvgColor,
          title: const Text(
            AppStrings.txtForRemoveFavourites,
            style: TextStyle(
              fontSize: 25,
              color: AppColors.primaryColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: NavigationService().popIt,
              child: const Text(
                AppStrings.txtForNo,
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                NavigationService().popIt();
                funcForRemove(index);
              },
              child: const Text(
                AppStrings.txtForYes,
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
