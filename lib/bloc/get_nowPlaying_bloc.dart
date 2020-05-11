import 'dart:developer';

import 'package:fluttermovieapp/model/movieResponse.dart';
import 'package:fluttermovieapp/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class NowPlayingListBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
  BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getPlayingMovies();
    log('response: $response');
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;

}
final nowPlayingMoviesBloc = NowPlayingListBloc();