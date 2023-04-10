class AppEndpoints {
  static const String url = "http://192.168.1.101:8000";

  static const String news = "/news/news/";

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
