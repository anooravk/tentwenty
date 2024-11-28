import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tentwenty/data/response/status.dart';
import 'package:tentwenty/models/genre/genre_model.dart';
import 'package:tentwenty/models/movies/movies_model.dart';

import '../../../repository/movies_repository/movies_repository.dart';
import '../../../res/assets/image_assets.dart';

class MoviesController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  var isSearching = false.obs;
  var isSubmitted = false.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    moviesListApi();
    genresListApi();
    super.onInit();
  }

  final _api = MoviesRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final moviesList = UpcomingMoviesModel().obs;
  final genresList = GenreModel().obs;
  final filteredMoviesList = [].obs;

  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setMoviesList(UpcomingMoviesModel _value) {
    moviesList.value = _value;
    filteredMoviesList.assignAll(_value.results ?? []);
    update();
  }

  void setGenresList(GenreModel _value) {
    genresList.value = _value;
    update();
  }

  void setError(String _value) => error.value = _value;

  void moviesListApi() {
    _api.moviesListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setMoviesList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
    update();
  }

  void genresListApi() {
    _api.genresListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setGenresList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
    update();
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);

    _api.moviesListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setMoviesList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
    update();
  }

  void filterMovies(String query) {
    if (query.isEmpty) {
      filteredMoviesList.assignAll(moviesList.value.results ?? []);
    } else {
      filteredMoviesList.assignAll(
        moviesList.value.results?.where((movie) => movie.title?.toLowerCase().contains(query.toLowerCase()) ?? false).toList() ?? [],
      );
    }
    update();
  }

  void setIsSearching(bool value) {
    isSearching.value = value;
    update();
  }

  void setIsSubmitted(bool value) {
    isSubmitted.value = value;
    update();
  }

  void filterMoviesByGenre(List<int> selectedGenreIds) {
    if (selectedGenreIds.isEmpty) {
      filteredMoviesList.assignAll(moviesList.value.results ?? []);
    } else {
      filteredMoviesList.assignAll(
        moviesList.value.results?.where((movie) {
              // Check if movie has any of the selected genres
              return movie.genreIds?.any((genreId) => selectedGenreIds.contains(genreId)) ?? false;
            }).toList() ??
            [],
      );
    }
    update();
  }

  List<String> getGenreNamesByIds(List<int> genreIds) {
    if (genresList.value.genres == null || genresList.value.genres!.isEmpty) {
      return [];
    }

    Map<int, String> genreMap = {for (var genre in genresList.value.genres ?? []) genre.id!: genre.name!};

    return genreIds.map((genreId) => genreMap[genreId] ?? '').toList();
  }

  final List<Map<String, String>> movies = [
    {
      'imageUrl': ImageAssets.genre1,
      'genre': 'Comedies',
    },
    {
      'imageUrl': ImageAssets.genre2,
      'genre': 'Crime',
    },
    {
      'imageUrl': ImageAssets.genre3,
      'genre': 'Family',
    },
    {
      'imageUrl': ImageAssets.genre4,
      'genre': 'Documentaries',
    },
    {
      'imageUrl': ImageAssets.genre5,
      'genre': 'Drama',
    },
    {
      'imageUrl': ImageAssets.genre6,
      'genre': 'Fantasy',
    },
    {
      'imageUrl': ImageAssets.genre7,
      'genre': 'Holidays',
    },
    {
      'imageUrl': ImageAssets.genre8,
      'genre': 'Horror',
    },
    {
      'imageUrl': ImageAssets.genre9,
      'genre': 'Sci-Fi',
    },
    {
      'imageUrl': ImageAssets.genre10,
      'genre': 'Thriller',
    },
  ];
}
