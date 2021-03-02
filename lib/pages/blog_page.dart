import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_panel/data/article_details_list.dart';
import 'package:users_panel/data/blog_category_list.dart';
import 'package:users_panel/model/article_details_model.dart';
import 'package:users_panel/model/blog_category_model.dart';
import 'package:users_panel/pages/article_by_category.dart';
import 'package:users_panel/pages/subpage/all_article_category_page.dart';
import 'package:users_panel/pages/subpage/read_article_page.dart';
import 'package:users_panel/pages/subpage/write_article_page.dart';
import 'package:users_panel/shared/custom_app_bar.dart';
class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List<BlogCategory> blogCategory = List<BlogCategory>();
  List<ArticleDetails> articleList = List<ArticleDetails>();

  @override
  void initState() {
    super.initState();
    blogCategory = getBlogCategory();
    articleList = getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      // Color(0xffF4F7F5),
      appBar: customAppBarDesign(context, "Daktarbari Blog"),
      body: _bodyUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateArticle())),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 2,
        tooltip: "Write an Article",
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  Widget _bodyUI() {
    Size size = MediaQuery.of(context).size;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        ///Search Field...
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 10),
        //   child: TextFormField(
        //     keyboardType: TextInputType.text,
        //     decoration: FormDecoration.copyWith(
        //         hintText: 'Search article by category',
        //         fillColor: Colors.grey[100],
        //         prefixIcon: Icon(Icons.search_rounded)),
        //   ),
        // ),
        //SizedBox(height: size.width / 20),

        _viewAllSection("Article Categories"),
        SizedBox(height: size.width / 40),
        _categoryBuilder(),
        SizedBox(height: size.width / 10),

        _viewAllSection("Recent Posts"),
        SizedBox(height: size.width / 40),
        _recentPostBuilder(),
        SizedBox(height: size.width / 10),

        _viewAllSection("Popular Posts"),
        SizedBox(height: size.width / 40),
        _recentPostBuilder(),
        SizedBox(height: size.width / 10),

        _viewAllSection("My Articles"),
        SizedBox(height: size.width / 40),
        _recentPostBuilder(),
      ],
    );
  }

  Widget _viewAllSection(String categoryName) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            categoryName,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
          //Text("View all",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 17,fontWeight: FontWeight.bold))
          GestureDetector(
              onTap: () {
                categoryName == 'Article Categories'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AllArticleCategory())):
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryArticle(categoryName)));
              },
              child: Icon(
                Icons.arrow_right_alt,
                size: 35,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
    );
  }

  Widget _categoryBuilder() {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 85,
        width: size.width,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: blogCategory.length,
            itemBuilder: (context, index) {
              return ArticleCategoryTile(
                categoryName: blogCategory[index].categoryName,
                totalPost: blogCategory[index].totalPost,
              );
            }));
  }

  Widget _recentPostBuilder() {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 310,
        width: size.width,
        //color: Colors.grey,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: articleList.length,
            itemBuilder: (context, index) {
              return PostTile(
                title: articleList[index].title,
                date: articleList[index].date,
                imageUrl: articleList[index].imageUrl,
                share: articleList[index].share,
                like: articleList[index].like,
                desc: articleList[index].description,
              );
            }));
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
        width: 150,
        height: 80,
        margin: EdgeInsets.only(right: 10,left: 2),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ///Background Image
            Container(
              height: 80,
              width: 150,
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
                width: 140,
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
              bottom: 3,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                  //width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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

// ignore: must_be_immutable
class PostTile extends StatelessWidget {
  String title, date, imageUrl,desc;
  int share, like;

  PostTile({this.title, this.date, this.imageUrl, this.like, this.share,this.desc});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadArticle(
            title: title,
            date: date,
            imageUrl: imageUrl,
            description: desc,
            share: share,
            like: like,
          ))),
      child: Container(
        width: 200,
        height: 310,
        margin: EdgeInsets.only(right: 10, top: 5, bottom: 5, left: 2.5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 2.0, offset: Offset(0, 1))
            ]),
        child: Stack(
          children: [
            ///Image
            Positioned(
                top: 0,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 90,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                            image: AssetImage(imageUrl), fit: BoxFit.fitWidth),
                      ),
                    ),
                    SizedBox(height: 5),

                    ///Title, date, description
                    Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Title...
                          Container(
                              width: 195,
                              child: Text(
                                title,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              )),
                          SizedBox(height: 5),
                          //Vertical line
                          Container(
                            height: 3,
                            width: 100,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(height: 5),
                          //Date...
                          Container(
                              width: 195,
                              child: Text(
                                date,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )),
                          SizedBox(height: 20),
                          //Description...
                          Container(
                              width: 195,
                              child: Text(
                                desc,
                                maxLines: 5,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              )),
                        ],
                      ),
                    )
                  ],
                )),

            ///Footer (like & share)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$like",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            CupertinoIcons.suit_heart,
                            color: Colors.pink,
                            size: 20,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$share",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            CupertinoIcons.arrowshape_turn_up_right,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}


