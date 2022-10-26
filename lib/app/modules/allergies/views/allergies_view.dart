import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/style.dart';
import 'package:whole/constants/whole_icons_icons.dart';

import '../controllers/allergies_controller.dart';

class AllergiesView extends GetView<AllergiesController> {
  @override
  Widget build(BuildContext context) {
    int allCount = 1;
    return GetBuilder<AllergiesController>(
        init: controller,
        builder: (controller) {
          return WholeAppScaffold(
              title: 'Allergies',
              hasAppBar: true,
              body: Container(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Allergies',
                          style: boldTextStyle(24),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Your list of allergies (${controller.allergiesCount})',
                          style: boldTextStyle(20),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Expanded(
                            child: GroupedListView<dynamic, String>(
                                elements: controller.allergies,
                                groupBy: (element) => element['type'],
                                groupComparator: (value1, value2) =>
                                    value2.compareTo(value1),
                                itemComparator: (item1, item2) =>
                                    item1['name'].compareTo(item2['name']),
                                order: GroupedListOrder.DESC,
                                groupSeparatorBuilder: (String value) => Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          color: Color(0XFF696770),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: ListTile(
                                                  leading: Icon(
                                                    Whole_icons.food,
                                                    size: 30,
                                                    color: Colors.white,
                                                  ),
                                                  title: Text(
                                                    '${value} Allergies',
                                                    style: boldTextStyle(20),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1,
                                                width: Get.width,
                                                child: Container(
                                                    color: kGrayishWhite),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                itemBuilder: (c, element) {
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Color(0XFF696770),
                                            boxShadow: kElevationToShadow[6]),
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        height: 50,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${allCount++}. ${element['name']}',
                                            style: regularTextStyle(16),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1,
                                        width: Get.width,
                                        child: Container(color: kGrayishWhite),
                                      )
                                    ],
                                  );
                                })),
                        SizedBox(
                          height: 20,
                        ),
                        WholeAppOutlinedButton(
                            text: 'Add/Edit Allergies'.toUpperCase(),
                            onPressed: () {
                              Get.toNamed(Routes.ADD_EDIT_ALLERGIES);
                            })
                      ]),
                ),
              ));
        });
  }
}
