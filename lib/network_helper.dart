


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'movie_model.dart';

class NetworkHelper{
  Future<GetMovies> getData() async {
    var movieModel;
    http.Response response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=27fe8aa285e6d11c8b3cf5fa638758e9&language=en-US&page=2'));
    if(response.statusCode == 200){

      var body = response.body;
      var jsonBody = jsonDecode(body);
      movieModel = GetMovies.fromJson(jsonBody);
    }
    return movieModel;
  }

}