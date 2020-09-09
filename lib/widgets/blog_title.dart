import 'package:flutter/material.dart';

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
