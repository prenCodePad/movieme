import 'package:flutter_app/config/config.dart';
import 'package:flutter_app/routing/routes.dart';
import 'package:get/get.dart';

import '../../common/common.dart';
import '../../models/models.dart';
import '../respositories.dart';

class MovieApiImpl extends MovieApi {
  const MovieApiImpl();
  final dio = const BaseDio();
  @override
  Future<List<MovieEvent>> getMovies() async {
    try {
      var response = await dio.create().get(Constants.movieUrl);
      if (response.statusCode == 401 || response.statusCode == 403) {
        _throwToLogin();
        return [];
      } else if (response.statusCode == 200) {
        return List<MovieEvent>.from((response.data ?? []).map((e) => MovieEvent.fromjson(e)));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  _throwToLogin() {
    StoragePrefs.removeStorageValue('name');
    StoragePrefs.removeStorageValue('token');
    Get.offAllNamed(Routes.loginScreen);
  }
}
