import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_news_app/models/article_model.dart';
import 'package:project_news_app/services/article_service.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final News temp;

  CategoryBloc(this.temp)
      : assert(temp != null),
        super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    // TODO Xử lý logic cho bloc
    yield CategoryInitial();
    if (event is CategoryEventRequest) {
      try {
        yield CategoryStateLoading();
        print(event.cateName);
        final List<ArticleModel> cateList = await temp.getNewsCategory(cate: event.cateName);
        yield CategoryStateLoaded(cateList: cateList);
      } on NetworkError {
        yield CategoryStateError('Load dữ liệu bị lỗi rồi');
      }
    } else {
      yield CategoryStateError('Load dữ liệu bị lỗi rồi');
    }
  }
}
