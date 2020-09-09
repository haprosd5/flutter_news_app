import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_news_app/helpers/data.dart';
import 'package:project_news_app/models/article_model.dart';
import 'package:project_news_app/models/category_model.dart';
import 'package:project_news_app/services/article_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> cateList = List<CategoryModel>();
  List<ArticleModel> news = List<ArticleModel>();

  bool loaded = false;

  @override
  void initState() {
    super.initState();
    cateList = getListCategory();
  }

  getNews() async {
    News temp = new News();
    await temp.getTopArticleFromUs('us');
    news = temp.news;
    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    getNews();

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
      body: loaded
          ? SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    /*
                    Thể loại tin tức
                    */
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
                    ),
                    /*
                    Hiển thi tin tức nổi bật
                    */
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
            )
          : Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
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
            child: Text(
              categoryName,
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class BlogTitle extends StatelessWidget {
  final String image, title, description;

  BlogTitle({this.image, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black54),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            description,
            maxLines: 3,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
