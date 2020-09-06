import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_news_app/helpers/data.dart';
import 'package:project_news_app/models/category_model.dart';
import 'package:project_news_app/services/article_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> cateList = List<CategoryModel>();

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
      body: SafeArea(
        child: GestureDetector(
          onTap: null,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: cateList.length,
                  itemBuilder: (context, index) {
                    return CategoryTitle(
                      categoryName: cateList[index].name,
                      urlImage: cateList[index].url,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final String urlImage;
  final String categoryName;

  CategoryTitle({this.urlImage, this.categoryName});

  @override
  Widget build(BuildContext context) {
    getTopArticleFromUs();
    return Container(
      margin: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            child: Image.network(
              urlImage,
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 120,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)), color: Colors.black45),
            child: Text(categoryName, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}
