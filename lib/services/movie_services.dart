
import 'package:dio/dio.dart';
import 'package:moviesapponepage/models/movie_model.dart';

//  okunması kolay ve yönlendirici olarak bana daha uygun bir paket dioyu tercih ettim.


class MovieServices {
  var apiUrl= "https://api.themoviedb.org/3/search/movie?api_key=ae304e3f4d3830d95075ae6914b55ddf&query=watchmen";


  Future<List<Movies>> getAllMovies() async {
    final response = await Dio().get(apiUrl,);

    if (response.statusCode == 200) {
      print(response.statusCode);
      final responseBody = response.data["results"] as List;
      print(responseBody);
      return responseBody.map((e) => Movies.fromJson(e)).toList();
    }

    throw Exception();
  }


}