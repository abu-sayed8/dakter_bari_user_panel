import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_panel/data/article_details_list.dart';
import 'package:users_panel/model/article_details_model.dart';
import 'package:users_panel/pages/subpage/read_article_page.dart';
import 'package:users_panel/shared/custom_app_bar.dart';

// ignore: must_be_immutable
class CategoryArticle extends StatefulWidget {
  String categoryName;
  CategoryArticle(this.categoryName);

  @override
  _CategoryArticleState createState() => _CategoryArticleState();
}

class _CategoryArticleState extends State<CategoryArticle> {

  List<ArticleDetails> articleList = List<ArticleDetails>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articleList = getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarDesign(context, widget.categoryName),
      body: _bodyUI(),
    );
  }

  Widget _bodyUI(){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: ListView.builder(
        itemCount: articleList.length,
        itemBuilder: (BuildContext context, int index){
          return PostTile(
            title: articleList[index].title,
            desc: articleList[index].description,
            imageUrl: articleList[index].imageUrl,
            date: articleList[index].date,
            share: articleList[index].share,
            like: articleList[index].like,
          );
        },
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
    Size size = MediaQuery.of(context).size;
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
        margin: EdgeInsets.only(left: 6,right: 6,top: 3,bottom: 20),
        //height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[800],
              //offset: Offset(1,1),
              blurRadius: 3
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header Image
            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(height: 4),

            //Article Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                title,
                maxLines: 3,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 5),

            //Vertical line
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 3,
              width: size.width*.6,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 5),

            //Article Date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                date,
                maxLines: 1,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 20),

            //Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                desc,
                maxLines: 5,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),

            //Like Share
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
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
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      )
    );
  }
}
