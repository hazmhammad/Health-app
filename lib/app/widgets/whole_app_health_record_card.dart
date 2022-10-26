import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/app/widgets/whole_app_list_card.dart';
import 'package:whole/constants/constants.dart';

class WholeAppHealthRecordCard extends StatelessWidget {
  final title;
  final subtitle;
  final count;
  final icon;
  final route;
  const WholeAppHealthRecordCard({
    Key? key,
    required this.title,
    this.icon,
    this.subtitle,
    this.count,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WholeAppListCard(
      child: Material(
        child: InkWell(
          onTap: () {
            Get.toNamed(route);
          },
          child: Center(
            child: ListTile(
              title: Text(
                title,
                style: boldTextStyle(16),
              ),
              subtitle: subtitle,
              leading: Padding(
                padding: subtitle != null
                    ? EdgeInsets.only(top: 8.0)
                    : EdgeInsets.only(top: 0.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  count != null
                      ? Text(
                          '($count)',
                          style: boldTextStyle(16),
                        )
                      : Container(),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
