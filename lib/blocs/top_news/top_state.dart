part of 'top_bloc.dart';

abstract class TopState extends Equatable {
  const TopState();
}

class TopNewsInitial extends TopState {
  @override
  List<Object> get props => [];
}

class TopNewsLoading extends TopState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// ignore: must_be_immutable
class TopNewsLoaded extends TopState {
  List<ArticleModel> news;

  TopNewsLoaded({this.news}) : assert(news != null);

  @override
  // TODO: implement props
  List<Object> get props => [news];
}

class TopNewsLoadError extends TopState {
  final String message;

  const TopNewsLoadError(this.message);

  @override
  List<Object> get props => [message];
}
