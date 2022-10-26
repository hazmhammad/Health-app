import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:whole/app/widgets/WholeOutlineButton.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/constants.dart';

import '../controllers/add_edit_allergies_controller.dart';

class AddEditAllergiesView extends GetView<AddEditAllergiesController> {
  IconData iconSwitch(String type) {
    switch (type) {
      case 'Food':
        return Whole_icons.food;
        break;
      case 'Environmental':
        return Whole_icons.tree;
        break;
      case 'Pet':
        return Whole_icons.pawprint;
        break;
      case 'Insect':
        return Whole_icons.bee;
        break;
      case 'Medication':
        return Whole_icons.drug;
        break;
      default:
        return Whole_icons.food;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditAllergiesController>(
        init: controller,
        builder: (controller) {
          return WholeAppScaffold(
            hasAppBar: true,
            body: Container(
              width: Get.width,
              padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Add Allergies',
                      style: boldTextStyle(24),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      style: regularTextStyle(16),
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: (value) => controller.filterAllregie(value),
                      decoration: InputDecoration(
                          fillColor: Color(0XFF696770),
                          filled: true,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                              borderSide: BorderSide(color: Colors.white)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 25,
                          ),
                          hintText: "Search Allergies",
                          hintStyle: TextStyle(
                              color: kGrayishWhite,
                              fontSize: 16,
                              fontFamily: 'Roboto'),
                          contentPadding: EdgeInsets.symmetric(vertical: 10)),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        controller.foundAllergie.value.isEmpty
                            ? Center(
                                child: Text(
                                  'not found',
                                  style: regularTextStyle(16),
                                ),
                              )
                            : GroupedListView<dynamic, String>(
                                shrinkWrap: true,
                                elements: controller.foundAllergie.value,
                                groupBy: (element) => element['type'],
                                groupSeparatorBuilder: (String value) => Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Row(
                                        children: [
                                          Icon(
                                            iconSwitch(value),
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 18,
                                          ),
                                          Text(
                                            '$value Allergies',
                                            style: boldTextStyle(20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: Get.width,
                                      height: 1,
                                      child: Container(
                                        color: kGrayishWhite,
                                      ),
                                    )
                                  ],
                                ),
                                itemBuilder: (c, element) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 25,
                                                height: 25,
                                                child: Checkbox(
                                                  checkColor: Colors.white,
                                                  fillColor:
                                                      MaterialStateProperty.all(
                                                          KAccentGreen),
                                                  value: element['checked'],
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  onChanged: (bool? value) {
                                                    element['checked'] = value;
                                                    controller.update();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                element['name'],
                                                style: regularTextStyle(16),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width,
                                        height: 1,
                                        child: Container(
                                          color: kGrayishWhite,
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: WholeOutlineButton(
                                text: 'CANCEL', onPressed: () {}),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child:
                                WholeAppButton(text: 'SAVE', onPressed: () {})),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
