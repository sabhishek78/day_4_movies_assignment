import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'movies.dart';
import 'dart:convert';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';


// You are given json string of movies list (see file movies.dart)
String moviesList = MoviesList.moviesJsonList;
List myList = jsonDecode(MoviesList.moviesJsonList);
int myListLength = myList.length;
List <String> movieNamesList = List();

// Hint:
// Convert the string to List of maps using jsonDecode and then use it

// Create a stateful widget called MoviesPage here


void main() {
  print('length of list=$myListLength');
 // print(myList);
  for (int i = 0; i <= myListLength - 1; i++) {
    Map temp = myList[i];
    movieNamesList.add(temp['poster']);
  }
 // print(movieNamesList);
  runApp(
    MaterialApp(
      home: MovieChanger(),
    ),
  );
}

class MovieChanger extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MovieChanger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body:
        Center(
          child: CarouselSlider(
            height: 400.0,
            autoPlay: true,
              autoPlayInterval: Duration(seconds: 1),
            items: movieNamesList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.amber
                      ),
                    child: Image.network(i),
                  );
                },
              );
            }).toList(),
          ),
        )
    );
  }
}
