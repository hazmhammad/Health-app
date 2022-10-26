import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:whole/constants/constants.dart';

class WholeAppListCard extends StatelessWidget {
  final Widget child;

  const WholeAppListCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Color(0XFF696770),
        ),
        child: child,
      ),
    );
  }
}
