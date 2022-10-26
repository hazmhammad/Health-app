import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/constants.dart';

import '../controllers/health_record_controller.dart';

class HealthRecordView extends GetView<HealthRecordController> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HealthRecordController>(
        init: controller,
        builder: (controller) {
          var recordList = controller.foundRecord.value;
          return WholeAppScaffold(
              hasAppBar: true,
              title: 'Health Record',
              body: Container(
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MY HEALTH RECORD',
                          style: boldTextStyle(25),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: searchController,
                          style: regularTextStyle(16),
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) => controller.filterRecord(value),
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
                              hintText: "Search Health Record",
                              hintStyle: TextStyle(
                                  color: kGrayishWhite,
                                  fontSize: 16,
                                  fontFamily: 'Roboto'),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              recordList.isEmpty
                                  ? Center(
                                      child: Text(
                                        '${searchController.text} not found',
                                        style: regularTextStyle(16),
                                      ),
                                    )
                                  : ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          controller.foundRecord.value.length,
                                      itemBuilder: (context, index) =>
                                          WholeAppHealthRecordCard(
                                        icon: recordList[index]['icon'],
                                        title: recordList[index]['title'],
                                        route: recordList[index]['route'],
                                        count: 0,
                                      ),
                                    ),
                              SizedBox(
                                height: 30,
                              ),
                              Divider(
                                thickness: 1,
                                color: kGrayishWhite,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              WholeAppHealthRecordCard(
                                route: '',
                                icon: Whole_icons.calculator,
                                title: 'Body Mass Index',
                                subtitle: Text(
                                  '(Not calculated)',
                                  style: regularTextStyle(14),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Divider(
                                thickness: 1,
                                color: kGrayishWhite,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'SOURCES',
                                style: boldTextStyle(20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              WholeAppHealthRecordCard(
                                route: '',
                                icon: Whole_icons.plus_circle,
                                title: 'My Blood Test',
                                subtitle: Text(
                                  'My Poratal',
                                  style: regularTextStyle(14),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              WholeAppOutlinedButton(
                                  text: 'ADD A SOURCE', onPressed: () {})
                            ],
                          ),
                        )
                      ],
                    ),
                  )));
        });
  }
}
