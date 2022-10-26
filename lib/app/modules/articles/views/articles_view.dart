import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/app/widgets/widgets.dart';

import '../../../models/Artical.dart';
import '../controllers/articles_controller.dart';

class ArticlesView extends GetView<ArticlesController> {

  final Article article;


  List<String> paragraphs = [
    "The least intrusive weight loss methods, and those most often recommended, are adjustments to eating patterns and increased physical activity, generally in the form of exercise. The World Health Organization recommended that people combine a reduction of processed foods high in saturated fats, sugar and salt.",
    "In order for weight loss to be permanent, changes in diet and lifestyle must be permanent as well. Short-term dieting has not been shown to produce either long term weight loss or better health, and may even be counterproductive.",
    "There is a substantial market for products which claim to make weight loss easier, quicker, cheaper, more reliable, or less painful. These include books, DVDs, CDs, cremes, lotions, pills, rings and earrings, body wraps, body belts and other materials, fitness centers, clinics, personal coaches, weight loss groups, and food products and supplements.",
    "In 2008 between US\$33 billion and \$55 billion was spent annually in the US on weight-loss products and services, including medical procedures and pharmaceuticals, with weight-loss centers taking between 6 and 12 percent of total annual expenditure. Over \$1.6 billion a year was spent on weight-loss supplements. About 70 percent of Americans' dieting attempts are of a self-help nature.",
    "Unintentional weight loss may result from loss of body fats, loss of body fluids,  muscle atrophy, or even a combination of these."
  ];

  List<String> sources = [
    "https://www.healthline.com/health/food-nutrition/best-weight-loss-books#1",
    "Stephen Guise, Mini Habits for Weight Loss, 2019",
  ];

  ArticlesView({required this.article});

  @override
  Widget build(BuildContext context) {
    return ArticleLanding(
      article: article,
      paragraphs: paragraphs,
      sources: sources,
      imagePath: "assets/images/bg-image.png",
      title: "How do I lose wegght?",
      author: "John Appleased",
      description:
          "Creative Lead, Speaker & CRO expert for IMPACT’s Marketing Team",
    );
  }
}

class ArticleLanding extends StatelessWidget {
  const ArticleLanding({
    Key? key,
    required this.paragraphs,
    required this.sources,
    required this.imagePath,
    required this.author,
    required this.description,
    required this.title,
    required this.article
  }) : super(key: key);

  final Article article;
  final String imagePath, author, description, title;
  final List<String> paragraphs, sources;

  @override
  Widget build(BuildContext context) {
    return WholeAppScaffold(
      hasAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xff514D60),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            color: Color(0xff696770),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  // color: Colors.white10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? "",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 33.0,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(imagePath),
                              radius: 32.0,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "By ${article.authorName}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  description,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                       Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(article.content ?? ""),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Sources",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ...article.sources!.map((e) {
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "-",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    e,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        );
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: double.infinity,
                          child: WholeAppButton(text: "DONE", onPressed: () {
                            ArticlesController.to.updateScore(target: article.target!, points: article.points!);
                          }))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
