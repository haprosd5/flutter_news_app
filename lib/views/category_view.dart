import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_news_app/blocs/categories/category_bloc.dart';
import 'package:project_news_app/helpers/helpers.dart';
import 'package:project_news_app/models/article_model.dart';
import 'package:project_news_app/widgets/blog_title.dart';
import 'package:project_news_app/widgets/build_initial_widget.dart';



class CategoriesView extends StatefulWidget {
  final String categoryName;

  const CategoriesView({Key key, this.categoryName}) : super(key: key);

  @override
  _CategoriesViewState createState() =>
      _CategoriesViewState(categoryName: categoryName);
}

class _CategoriesViewState extends State<CategoriesView> {
  final String categoryName;

  _CategoriesViewState({this.categoryName});
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    BlocProvider.of<CategoryBloc>(context)
        .add(CategoryEventRequest(mapToCategories(this.categoryName)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              categoryName,
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryInitial) {

            return InitialWidget();
          } else if (state is CategoryStateLoading) {
            print('loading');
            return InitialWidget();
          } else if (state is CategoryStateLoaded) {
            print('load success');
            return buildScreenHomeWithData(context, state.cateList);
          } else {
            return InitialWidget();
          }
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}

Widget buildScreenHomeWithData(BuildContext context, List<ArticleModel> news) {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        children: <Widget>[
          /**
                * Hiển thi tin tức nổi bật */
          Container(
            child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: news.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return BlogTitle(
                    title: news[index].title,
                    image: news[index].urlToImage,
                    description: news[index].description,
                  );
                }),
          )
        ],
      ),
    ),
  );
}
