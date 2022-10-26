import 'package:flutter/material.dart';

class CongratulationsWiget extends StatelessWidget {
  const CongratulationsWiget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.done_sharp,
              color: Color(0xff514d60),
              size: 80,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Congratulations Paul!",
            style:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "You’ve completed reading the article!",
            style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              text: 'You’ve Increased your ',
              // style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                    text: 'BODY',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' Score by 2 Points'),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 60,
            height: 5,
            color: Color(0xff2A6EBB),
          ),
        ],
      ),
    );
  }
}