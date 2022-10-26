import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/style.dart';
import 'package:whole/constants/whole_icons_icons.dart';

import '../controllers/vaccine_controller.dart';

class VaccineView extends GetView<VaccineController> {
  int allCount = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VaccineController>(
        init: controller,
        builder: (controller) {
          return WholeAppScaffold(
            hasAppBar: true,
            body: Container(
              width: Get.width,
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Immunizations',
                    style: boldTextStyle(25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Your list of vaccines (3)',
                    style: boldTextStyle(20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: GroupedListView<dynamic, String>(
                          elements: controller.immunizations,
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
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: value == 'Travel'
                                              ? Icon(
                                                  Whole_icons.plane,
                                                  size: 30,
                                                  color: Colors.white,
                                                )
                                              : Icon(
                                                  Whole_icons.dropper,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                          title: Text(
                                            '${value} Vaccinations',
                                            style: boldTextStyle(20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          itemBuilder: (c, element) {
                            return WholeAppListCard(
                              child: Material(
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed('route');
                                  },
                                  child: Center(
                                    child: ListTile(
                                      title: Text(
                                        element['name'].toString(),
                                        style: boldTextStyle(16),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
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
                          })),
                  SizedBox(
                    height: 30,
                  ),
                  WholeAppOutlinedButton(
                      text: 'add new vaccine'.toUpperCase(), onPressed: () {})
                ],
              ),
            ),
          );
        });
  }
}
