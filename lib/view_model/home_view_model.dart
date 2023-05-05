import 'package:flutter/cupertino.dart';
import 'package:moviesapponepage/models/movie_model.dart';
import 'package:moviesapponepage/services/movie_services.dart';
import 'package:provider/provider.dart';


import '../view/search/home.dart';

abstract class HomeViewModel extends State<Home> {

  List<Movies> movies = <Movies>[];


  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  void  getAllProducts() async {
    movies = await context.read<MovieServices>().getAllMovies();
    setState(() {

    });
  }
}