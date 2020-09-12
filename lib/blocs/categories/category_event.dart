part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

// ignore: must_be_immutable
class CategoryEventRequest extends CategoryEvent {
  String cateName;
  CategoryEventRequest(this.cateName):assert(cateName != null);
  @override
  // TODO: implement props
  List<Object> get props => [cateName];

}
