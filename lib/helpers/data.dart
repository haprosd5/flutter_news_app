import 'package:project_news_app/models/category_model.dart';

List<CategoryModel> getListCategory() {
  List<CategoryModel> cateList = List<CategoryModel>();

  cateList.add(
    new CategoryModel(
        name: 'Business',
        url:
            'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80'),
  );
  cateList.add(
    new CategoryModel(
        name: 'Sport',
        url:
            'https://images.unsplash.com/photo-1483721310020-03333e577078?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80'),
  );
  cateList.add(
    new CategoryModel(
        name: 'Fashion',
        url:
            'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'),
  );
  cateList.add(
    new CategoryModel(
        name: 'Heath',
        url:
            'https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
  );
  cateList.add(
    new CategoryModel(
        name: 'Travel',
        url:
            'https://images.unsplash.com/photo-1596972815676-44315ddc285f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
  );
  cateList.add(
    new CategoryModel(
        name: 'Nature',
        url:
            'https://images.unsplash.com/photo-1598923096298-ddcb6a64798b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
  );


  return cateList;
}
