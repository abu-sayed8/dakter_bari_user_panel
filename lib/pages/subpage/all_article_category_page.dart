import 'package:flutter/material.dart';
import 'package:users_panel/data/blog_category_list.dart';
import 'package:users_panel/model/blog_category_model.dart';
import 'package:users_panel/pages/article_by_category.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
class AllArticleCategory extends StatefulWidget {
  @override
  _AllArticleCategoryState createState() => _AllArticleCategoryState();
}

class _AllArticleCategoryState extends State<AllArticleCategory> {

  List<BlogCategory> blogCategory = List<BlogCategory>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogCategory = getBlogCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, 'Article Categories'),
      body: _bodyUI(),
    );
  }

  Widget _bodyUI(){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 2
          ),
          itemCount: blogCategory.length,
          itemBuilder: (BuildContext context, int index){
            return ArticleCategoryTile(
              categoryName: blogCategory[index].categoryName,
              totalPost: blogCategory[index].totalPost,
            );
          }
      ),
    );
  }
}

// ignore: must_be_immutable
class ArticleCategoryTile extends StatelessWidget {
  final String categoryName;
  final int totalPost;

  ArticleCategoryTile({this.categoryName, this.totalPost});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryArticle(categoryName)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ///Background Color
            Container(
              decoration: BoxDecoration(
                color: Color(0xffF4F7F5),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0,.2),
                          blurRadius: 2
                      )
                    ]
              ),
            ),

            ///Category name
            Container(
                child: Text(
                  categoryName,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.article_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "$totalPost",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
