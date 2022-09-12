import 'package:apiexample/network_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_model.dart';

class ShowData extends StatefulWidget {

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {


  Future<GetMovies>? movieData;

  //call from network helper
  Future<GetMovies> getMovieData()async{
    var data = await NetworkHelper().getData();
    return data;
      }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieData = getMovieData();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<GetMovies>(
          future: movieData,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.results?.length,
                itemBuilder: (BuildContext context, index){
                  var initial = snapshot.data?.results?[index];
                  return Column(
                    children: [
                      Text(initial?.originalTitle.toString() ?? 'No data'),
                      Text(initial?.overview ?? 'No Data'),
                    ],
                  );

                },



              );

            }
            else{
              return LinearProgressIndicator();
            }

          }
        ),
      )
    );
  }
}

