String mapToCategories(String input) {
  String temp;
  switch (input) {
    case 'Business':
      temp = 'business';
      break;
    case 'Sport':
      temp = 'sports';
      break;
    case 'Fashion':
      temp = 'entertainment';
      break;
    case 'Heath':
      temp = 'health';
      break;
    case 'Science':
      temp = 'science';
      break;
    case 'Technology':
      temp = 'technology';
      break;
    default:
      temp = 'business';
      break;
  }
  return temp;
}
