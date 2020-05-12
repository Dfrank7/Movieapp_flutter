import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermovieapp/bloc/get_genre_bloc.dart';
import 'package:fluttermovieapp/model/genre.dart';
import 'package:fluttermovieapp/model/genreResponse.dart';
import 'package:fluttermovieapp/widgets/genreList.dart';

class Genres extends StatefulWidget{
  @override
  _Genres createState() => _Genres();

}

class _Genres extends State<Genres>{

  @override
  void initState(){
    super.initState();
    genreBloc..getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
      stream: genreBloc.subject.stream,
      builder: (context, AsyncSnapshot<GenreResponse> snapshot) {
        debugPrint('genre: $snapshot');
        var data = snapshot.hasData;
        debugPrint('genre2: $data');
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildGenresWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildGenresWidget(GenreResponse response){
    List<Genre> genres = response.genres;
    if(genres.length == 0){
      return Container(
        child: Text("No Genres Available"),

      );
    }else{
      return GenreList(genres: genres);
    }
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: CircularProgressIndicator(
                valueColor:
                new AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 4.0,
              ),
            )
          ],
        ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occured: $error"),
          ],
        ));
  }

}