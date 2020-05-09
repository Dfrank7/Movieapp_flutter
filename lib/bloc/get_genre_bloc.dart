import 'package:fluttermovieapp/model/genreResponse.dart';
import 'package:fluttermovieapp/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GenreListBloc{
  final MovieRepository repository = MovieRepository();
  final BehaviorSubject<GenreResponse> subject = BehaviorSubject<GenreResponse>();

  getGenres() async {
    GenreResponse response = await repository.getGenres();
    subject.sink.add(response);
  }

  dispose() {
    subject.close();
  }

  BehaviorSubject<GenreResponse> get _subject => subject;
}

final genreBloc = GenreListBloc();