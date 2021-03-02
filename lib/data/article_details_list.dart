import 'package:users_panel/model/article_details_model.dart';

List<ArticleDetails> getArticle() {
  String desc = "Three leading George Institute researchers have together"
      " scored just over \$2.5 million for innovative projects in the latest "
      "round of National Health and Medical Research Council Ideas Grants."
      "Three leading George Institute researchers have together"
      " scored just over \$2.5 million for innovative projects in the latest "
      "round of National Health and Medical Research Council Ideas Grants."
      "Three leading George Institute researchers have together"
      " scored just over \$2.5 million for innovative projects in the latest "
      "round of National Health and Medical Research Council Ideas Grants."
      "Three leading George Institute researchers have together"
      " scored just over \$2.5 million for innovative projects in the latest "
      "round of National Health and Medical Research Council Ideas Grants.\n\n"
      "Three leading George Institute researchers have together"
      " scored just over \$2.5 million for innovative projects in the latest "
      "round of National Health and Medical Research Council Ideas Grants."
      "Three leading George Institute researchers have together"
      " scored just over \$2.5 million for innovative projects in the latest "
      "round of National Health and Medical Research Council Ideas Grants."
      "Three leading George Institute researchers have together"
      " scored just over \$2.5 million for innovative projects in the latest "
      "round of National Health and Medical Research Council Ideas Grants."
      "Three leading George Institute researchers have together"
      " scored just over \$2.5 million for innovative projects in the latest "
      "round of National Health and Medical Research Council Ideas Grants."
  ;

  List<ArticleDetails> list = List<ArticleDetails>();
  ArticleDetails articleDetails = new ArticleDetails();

  articleDetails.title = "Autonomous vehicles, child restraints and food and "
      "water security: bright ideas attract funding";
  articleDetails.date = "28/12/2020";
  articleDetails.imageUrl = "assets/category/medicine.jpg";
  articleDetails.like = 36;
  articleDetails.share = 20;
  articleDetails.description = desc;
  list.add(articleDetails);

  articleDetails = new ArticleDetails();
  articleDetails.title =
  "Burns prevention and treatment an urgent priority for Indigenous children";
  articleDetails.date = "27/12/2020";
  articleDetails.imageUrl = "assets/category/story.jpg";
  articleDetails.like = 56;
  articleDetails.share = 28;
  articleDetails.description = desc;
  list.add(articleDetails);

  articleDetails = new ArticleDetails();
  articleDetails.title =
  "Burns prevention and treatment an urgent priority for Indigenous children";
  articleDetails.date = "25/12/2020";
  articleDetails.imageUrl = "assets/category/food.jpg";
  articleDetails.like = 200;
  articleDetails.share = 62;
  articleDetails.description = desc;
  list.add(articleDetails);

  articleDetails = new ArticleDetails();
  articleDetails.title =
  "Burns prevention and treatment an urgent priority for Indigenous children";
  articleDetails.date = "25/12/2020";
  articleDetails.imageUrl = "assets/category/tourism.jpg";
  articleDetails.like = 110;
  articleDetails.share = 98;
  articleDetails.description = desc;
  list.add(articleDetails);

  articleDetails = new ArticleDetails();
  articleDetails.title =
  "Burns prevention and treatment an urgent priority for Indigenous children";
  articleDetails.date = "22/12/2020";
  articleDetails.imageUrl = "assets/category/news.jpg";
  articleDetails.like = 50;
  articleDetails.share = 43;
  articleDetails.description = desc;
  list.add(articleDetails);

  return list;
}
