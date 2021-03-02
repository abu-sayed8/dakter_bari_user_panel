import 'package:users_panel/model/blog_category_model.dart';

List<BlogCategory> getBlogCategory(){
  List<BlogCategory> list = List<BlogCategory>();
  BlogCategory blogCategory = new BlogCategory();

  blogCategory.categoryName = "News";
  blogCategory.totalPost = 36;
  list.add(blogCategory);

  blogCategory = new BlogCategory();
  blogCategory.categoryName = "Diseases & Cause";
  blogCategory.totalPost = 54;
  list.add(blogCategory);

  blogCategory = new BlogCategory();
  blogCategory.categoryName = "Health Tips";
  blogCategory.totalPost = 39;
  list.add(blogCategory);

  blogCategory = new BlogCategory();
  blogCategory.categoryName = "Food & Nutrition";
  blogCategory.totalPost = 23;
  list.add(blogCategory);

  blogCategory = new BlogCategory();
  blogCategory.categoryName = "Medicine & Treatment";
  blogCategory.totalPost = 78;
  list.add(blogCategory);

  blogCategory = new BlogCategory();
  blogCategory.categoryName = "Medicare & Hospital";
  blogCategory.totalPost = 76;
  list.add(blogCategory);

  blogCategory = new BlogCategory();
  blogCategory.categoryName = "Tourism & Cost";
  blogCategory.totalPost = 39;
  list.add(blogCategory);

  blogCategory = new BlogCategory();
  blogCategory.categoryName = "Symptoms";
  blogCategory.totalPost = 24;
  list.add(blogCategory);

  blogCategory = new BlogCategory();
  blogCategory.categoryName = "Visual Story";
  blogCategory.totalPost = 63;
  list.add(blogCategory);

  return list;
}