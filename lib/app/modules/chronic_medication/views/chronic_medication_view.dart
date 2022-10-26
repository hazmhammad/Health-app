import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/constants.dart';

import '../controllers/chronic_medication_controller.dart';

class ChronicMedicationView extends GetView<ChronicMedicationController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChronicMedicationController>(
        init: controller,
        builder: (controller) {
          return WholeAppScaffold(
              body: Container(
                width: Get.width,
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chronic Medication',
                      style: boldTextStyle(25),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Your list of medication (3)',
                      style: boldTextStyle(20),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.medicationList.length,
                          itemBuilder: (context, index) => WholeAppListCard(
                                child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed('route');
                                    },
                                    child: Center(
                                      child: ListTile(
                                        title: Text(
                                          controller.medicationList[index]
                                                  ['name']
                                              .toString(),
                                          style: boldTextStyle(16),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '${controller.medicationList[index]['dosage']} ${controller.medicationList[index]['unit']}',
                                              style: boldTextStyle(16),
                                            ),
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
                              )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    WholeAppOutlinedButton(
                        text: 'Add a Medication'.toUpperCase(),
                        onPressed: () {})
                  ],
                ),
              ),
              hasAppBar: true);
        });
  }
}
