import 'package:flutter/material.dart';
import 'package:whole/app/models/Artical.dart';
import 'package:whole/app/modules/articles/views/articles_view.dart';
import 'package:whole/constants/constants.dart';

import 'widgets.dart';

class WholeAppArticleCard extends StatelessWidget {
 final Article article;
  // final VoidCallback learnMore;
  const WholeAppArticleCard({
    Key? key,

   required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 316,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 291 * 0.6,
                height: 316 * 0.25,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 25.0),
                  child: Text(
                    article.title ?? "",
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 252,
                  height: 315 * 0.30,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                    child: Text(
                      article.content ?? "",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      color: kFairBlue,
                      child: SizedBox(
                        height: 51,
                        width: 5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 252 * 0.75,
                        height: 315 * .15,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: RichText(
                              text: TextSpan(
                                  style: new TextStyle(
                                      color: Color(0xff4A4A4A),
                                      fontSize: 16,
                                      fontFamily: 'Roboto'),
                                  children: [
                                    TextSpan(
                                        text: 'Complete this activity for ${article.points} '),
                                    TextSpan(
                                        text: 'WHOLE',
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' points!'),
                                  ]),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: WholeAppOutlinedButton(
                            text: 'LATER', onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlesView(article: article,)));
                        })),
                    SizedBox(width: 10,),
                    Expanded(
                      child: WholeAppButton(
                          text: 'LEARN MORE', onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlesView(article: article,)));
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




/*Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 316,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 291 * 0.6,
              height: 316 * 0.25,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 25.0),
                child: Text(
                  title,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 252,
                height: 315 * .30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                  child: Text(
                    description,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    color: kFairBlue,
                    child: SizedBox(
                      height: 51,
                      width: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 252 * 0.75,
                      height: 315 * .15,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    color: Color(0xff4A4A4A),
                                    fontSize: 16,
                                    fontFamily: 'Roboto'),
                                children: [
                                  TextSpan(
                                      text: 'Complete this activity for 2 '),
                                  TextSpan(
                                      text: 'WHOLE',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: ' points!'),
                                ]),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                      child: WholeAppOutlinedButton(
                          text: 'LATER', onPressed: learnMore)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WholeAppButton(
                        text: 'LEARN MORE', onPressed: learnMore),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );*/ 