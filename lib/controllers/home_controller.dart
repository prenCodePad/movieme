import 'package:get/get.dart';

import '../common/common.dart';
import '../models/models.dart';

class HomeController extends GetxController with AppMixin {
  final movies = <MovieEvent>[].obs;
  final loader = false.obs;

  List<MovieEvent> allMovies = [];

  @override
  void onInit() async {
    getMovies();
    super.onInit();
  }

  getMovies() async {
    loader.value = true;
    await movieService.getMovies().then((v) {
      movies.value = v;
      allMovies = v;
    });
    loader.value = false;
  }

  searchMovies(String pattern) {
    if (pattern.trim().length > 2) {
      movies.value = movies.where((p) => p.name.toLowerCase().contains(pattern.toLowerCase())).toList();
    } else {
      movies.value = allMovies;
    }
  }
}
