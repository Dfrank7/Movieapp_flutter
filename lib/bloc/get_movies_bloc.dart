import 'package:fluttermovieapp/model/movieResponse.dart';
import 'package:fluttermovieapp/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBlocList{

  final MovieRepository repository = MovieRepository();
  final BehaviorSubject<MovieResponse> subject = BehaviorSubject<MovieResponse>();

  getPopularMovies() async {
    MovieResponse response = await repository.getPopularMovies();
    subject.sink.add(response);
  }

  dispose(){
    subject.close();
  }

  BehaviorSubject<MovieResponse> get _subject => subject;
}

final popularMoviesBloc = MoviesBlocList();