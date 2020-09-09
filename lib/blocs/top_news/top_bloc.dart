import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_news_app/models/article_model.dart';
import 'package:project_news_app/services/article_service.dart';

part 'top_event.dart';

part 'top_state.dart';

class TopBloc extends Bloc<TopEvent, TopState> {
  final News temp;

  TopBloc(this.temp) : super(TopNewsInitial());

  @override
  Stream<TopState> mapEventToState(
    TopEvent event,
  ) async* {
    // TODO: Hiển thị trạng thái và xử lý các sự kiện

    if (event is GetNewsEvent) {
      try {
        yield TopNewsLoading();
        final List<ArticleModel> news = await temp.getTopArticleFromUs('us');
        yield TopNewsLoaded(news: news);
      } on NetworkError {
        yield TopNewsLoadError('Load thoi tiet bi loi');
      }
    } else {
      yield TopNewsLoadError('Load thoi tiet bi loi');
    }
  }
}
