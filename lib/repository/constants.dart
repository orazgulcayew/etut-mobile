class AppEndpoints {
  static const String url = "http://172.16.0.71/api";

  static const String news = "/news/news/";
  static const String newsCat = "/news/news_category/";

  static const String faculty = "/faculty/faculties/";

  static const String research = "/research/research/";
  static const String researchCat = "/research/research-category/";

  static const String teachers = '/graduates/teachers/';

  static const String category = "/api/library/categories/list";
  static const String homeProducts = "/api/products/mainpage/list/";
  static const String banners = "/api/library/banners/list/";
  static const String allProducts = "/api/products/list/";

  //Auth
  static const String register = "/api/users/register/";
  static const String login = "/api/users/login/";
  static const String profileData = "/api/users/profile/info/";
  static const String updateProfile = "/api/users/profile/update/";

  static String productDetails(int id) => "/api/products/detail/$id/";
  static String subcategoryByCategory(int id) =>
      "/api/library/categories/$id/subcategories/list/";
  static String productsByCategory(int id) =>
      "/api/products/category/$id/list/";
  static String productsBySubcategory(int id) =>
      "/api/products/subcategory/$id/list/";
  static String productsByBrand(int id) => "/api/products/brands/$id/list/";
}
