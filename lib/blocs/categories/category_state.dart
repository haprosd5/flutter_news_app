part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryStateLoading extends CategoryState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class CategoryStateLoaded extends CategoryState {
  List<ArticleModel> cateList;
  CategoryStateLoaded({this.cateList}) : assert(cateList != null);
  @override
  // TODO: implement props
  List<Object> get props => [cateList];
}

class CategoryStateError extends CategoryState {
  final String message;

  const CategoryStateError(this.message);

  @override
  List<Object> get props => [message];
}
