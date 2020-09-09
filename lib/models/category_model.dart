class CategoryModel {
  String url;
  String name;

  CategoryModel({this.name, this.url});

  String mapToCategories(String input) {
    switch(input) {
      case 'Business':
        return 'business';
      case 'Sport':
        return 'sports';
      case 'Fashion':
        return 'entertainment';
      case 'Heath':
        return 'health';
      case 'Science':
        return 'science';
      case 'Technology':
        return 'technology';
      default:
        return 'business';
    }
  }
}