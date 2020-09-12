import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_news_app/blocs/categories/category_bloc.dart';
import 'package:project_news_app/blocs/top_news/top_bloc.dart';
import 'package:project_news_app/helpers/data.dart';
import 'package:project_news_app/models/article_model.dart';
import 'package:project_news_app/models/category_model.dart';
import 'package:project_news_app/views/category_view.dart';
import 'package:project_news_app/widgets/blog_title.dart';
import 'package:project_news_app/widgets/build_initial_widget.dart';
import 'package:project_news_app/widgets/cate_title.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> cateList = List<CategoryModel>();

  bool loaded = false;

  @override
  void initState() {
    super.initState();
    cateList = getListCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: BlocListener<TopBloc, TopState>(
        listener: (context, state) {
          if (state is TopNewsLoadError) {
            // ignore: missing_return
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<TopBloc, TopState>(builder: (context, state) {
          if (state is TopNewsInitial) {
            BlocProvider.of<TopBloc>(context).add(GetNewsEvent());
            return InitialWidget();
          } else if (state is TopNewsLoading) {
            return InitialWidget();
          } else if (state is TopNewsLoaded) {
            return buildScreenHomeWithData(context, state.news, this.cateList);
          } else {
            return InitialWidget();
          }
        }),
      ),
      backgroundColor: Colors.white,
    );
  }
}

Widget buildScreenHomeWithData(BuildContext context, List<ArticleModel> news,
    List<CategoryModel> cateList) {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        children: <Widget>[
          /** Thể loại tin tức*/
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: cateList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
/*                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CategoriesView(categoryName: cateList[index].name),
                      ),
                    );*/
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<CategoryBloc>(context),
                          child: CategoriesView(
                              categoryName: cateList[index].name),
                        ),
                      ),
                    );
                  },
                  child: CategoryTitle(
                    categoryName: cateList[index].name,
                    urlImage: cateList[index].url,
                  ),
                );
              },
            ),
          ),
          /** Hiển thi tin tức nổi bật */
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
