import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttermovieapp/bloc/get_movies_bloc.dart';
import 'package:fluttermovieapp/style/theme.dart' as Style;
import 'package:fluttermovieapp/widgets/genres.dart';
import 'package:fluttermovieapp/widgets/now_playing.dart';
import 'package:fluttermovieapp/widgets/personList.dart';
import 'package:fluttermovieapp/widgets/popularMovies.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

  class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: Icon(EvaIcons.menu2Outline, color: Colors.white),
        actions: [
        ],
        title: Text("Movies App"),
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          Genres(),
          PersonList(),
          PopularMovies()

        ],
      ),
    );
  }
}