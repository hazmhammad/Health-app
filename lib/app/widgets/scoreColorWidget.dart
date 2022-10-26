import 'package:flutter/material.dart';
import 'package:whole/constants/style.dart';

class ScoreColor extends StatelessWidget {
  const ScoreColor({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.score,
    required this.color,
  }) : super(key: key);

  final String title, subtitle, score;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          width: 10,
          height: 50,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                // style: TextStyle(
                //   fontSize: 16,
                //   fontWeight: FontWeight.bold,
                // ),
                style: boldTextStyle(16),
              ),
              //TODO: was subtitle ever used anywhere?
              Text(
                subtitle,
                // style: TextStyle(
                //   fontSize: 16,
                // ),
                style: regularTextStyle(16),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        // Spacer(),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                score,
                // style: TextStyle(
                //   fontSize: 25,
                //   fontWeight: FontWeight.bold,
                // ),
                style: boldTextStyle(25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
