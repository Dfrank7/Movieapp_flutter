import 'package:flutter/cupertino.dart';
import 'package:fluttermovieapp/model/videoResponse.dart';
import 'package:fluttermovieapp/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class VideoBloc{
  final MovieRepository repository = MovieRepository();
  final BehaviorSubject<VideoResponse> _subject =
  BehaviorSubject<VideoResponse>();

  getVideo(int id) async {
    VideoResponse response = await repository.getMovieVideos(id);
    _subject.sink.add(response);
  }

  void drainStream(){ _subject.value = null; }
  @mustCallSuper
  void dispose() async{
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<VideoResponse> get subject => _subject;
}
final movieVideosBloc = VideoBloc();