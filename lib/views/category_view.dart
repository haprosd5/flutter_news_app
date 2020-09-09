import 'package:flutter/material.dart';
import 'package:project_news_app/widgets/blog_title.dart';

class CategoriesView extends StatefulWidget {
  final String categoryName;

  const CategoriesView({Key key, this.categoryName}) : super(key: key);

  @override
  _CategoriesViewState createState() => _CategoriesViewState(categoryName: categoryName);
}

class _CategoriesViewState extends State<CategoriesView> {
  final String categoryName;

  _CategoriesViewState({this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.cancel, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
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
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return BlogTitle(
                title: 'news[index].title',
                image: 'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80'/*news[index].urlToImage*/,
                description: 'Mieu ta'/*news[index].description*/,
              );
            }),
      ),
      backgroundColor: Colors.white,
    );
  }
}


