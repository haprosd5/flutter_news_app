import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_news_app/models/article_model.dart';
import 'package:project_news_app/services/article_service.dart';

part 'top_event.dart';
part 'top_state.dart';

class TopBloc extends Bloc<TopEvent, TopState> {
  News news;
  TopBloc({this.news}) : super(TopInitial());

  @override
  Stream<TopState> mapEventToState(
    TopEvent event,
  ) async* {
    // TODO: Hien thi trang thai va xu ly
    if (event is TopEventRequest) {
      yield TopNewsLoading();

    }
  }
}
