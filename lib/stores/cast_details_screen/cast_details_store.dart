import 'package:mobx/mobx.dart';

import '../../../api_services/repository.dart';
import '../../components/custom_classes/custom_exceptions.dart';
import '../../models/cast/cast_model.dart';
import '../../models/cast_details/cast_details_model.dart';
import '../../utils/strings.dart';

part 'cast_details_store.g.dart';

class CastDetailsStore = _CastDetailsStore with _$CastDetailsStore;

abstract class _CastDetailsStore with Store {
  final CastModel castData;
  _CastDetailsStore({required this.castData}) {
    getCastDetails();
  }

  @observable
  CastDetailsModel bioData = CastDetailsModel(castBio: '', department: '');

  @observable
  String castDetailsError = AppStrings.blankString;

  Future<void> getCastDetails() async {
    try {
      final result = await Repository().fetchCastDetails(
        castId: castData.id,
      );
      bioData = result;
    } on CustomException catch (e) {
      castDetailsError = e.customText;
    }
  }
}
