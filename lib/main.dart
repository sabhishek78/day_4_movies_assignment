import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'movies.dart';
import 'dart:convert';
import 'dart:math';



// You are given json string of movies list (see file movies.dart)
String moviesList = MoviesList.moviesJsonList;
List myList=jsonDecode(MoviesList.moviesJsonList);
int myListLength=myList.length;

// Hint:
// Convert the string to List of maps using jsonDecode and then use it

// Create a stateful widget called MoviesPage here





void main() {
  print('length of list=$myListLength');
  print(myList);
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
  Random rand=new Random();
  String movieLink="https://raw.githubusercontent.com/android10/Sample-Data/master/Android-CleanArchitecture-Kotlin/posters/038001.jpg";

void changeMoviePoster()
{
  int index=rand.nextInt(myListLength);
  Map temp=myList[index];
  setState(() {
    movieLink=temp['poster'];
  });

}






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Movies Poster',
            style: TextStyle(color: Colors.black),

          ),
          centerTitle: true,
        ),


        body: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                SizedBox(height: 30),
                Image.network('$movieLink'),
                FlatButton(
                  color: Colors.blue,
                  child:
                  Text('Next Movie'),

                  onPressed:
                  changeMoviePoster,


                ),

              ],
          ),
        )

    );
  }
}
