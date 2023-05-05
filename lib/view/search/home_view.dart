library home_view;
import 'package:flutter/material.dart';


import '../../constants/color.dart';
import '../../models/movie_model.dart';
import '../../view_model/home_view_model.dart';
part 'components/home_view_header.dart';

class HomeView extends HomeViewModel {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(

          color: white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeViewHeader(allMovies: movies,),
              // SearchViewBody(),
              const SizedBox(height: 70,)
            ],
          ),
        ),
      ),
    );
  }
}
