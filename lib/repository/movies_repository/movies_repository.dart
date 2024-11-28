import 'package:tentwenty/data/network/network_api_services.dart';
import 'package:tentwenty/models/genre/genre_model.dart';
import 'package:tentwenty/models/movies/movies_model.dart';
import 'package:tentwenty/res/app_url/app_url.dart';

class MoviesRepository {
  final _apiService = NetworkApiServices();

  Future<UpcomingMoviesModel> moviesListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.moviesUrl);
    return UpcomingMoviesModel.fromJson(response);
  }

  Future<GenreModel> genresListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.genreUrl);
    return GenreModel.fromJson(response);
  }
}
