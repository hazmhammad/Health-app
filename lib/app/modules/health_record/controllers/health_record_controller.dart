import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/constants/whole_icons_icons.dart';

class HealthRecordController extends GetxController {
  final List<Map<String, dynamic>> listRecords = [
    {
      'title': 'Allergies',
      'icon': Whole_icons.dropper,
      'route': Routes.ALLERGIES,
    },
    {
      'title': 'Chronic Medication',
      'icon': Whole_icons.drug,
      'route': Routes.CHRONIC_MEDICATION,
    },
    {
      'title': 'Conditions',
      'icon': Whole_icons.stethoscope,
      'route': '',
    },
    {
      'title': 'Immunizations',
      'icon': Whole_icons.immunization,
      'route': '',
    },
    {
      'title': 'Lab Results',
      'icon': Whole_icons.labtest,
      'route': '',
    },
    {
      'title': 'Procedures',
      'icon': Whole_icons.plus_circle,
      'route': '',
    },
  ];

  Rx<List<Map<String, dynamic>>> foundRecord =
      Rx<List<Map<String, dynamic>>>([]);
  @override
  void onInit() {
    super.onInit();
    foundRecord.value = listRecords;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void filterRecord(String title) {
    List<Map<String, dynamic>> results = [];
    if (title.isEmpty) {
      results = listRecords;
    } else {
      results = listRecords
          .where((element) => element['title']
              .toString()
              .toLowerCase()
              .contains(title.toLowerCase()))
          .toList();
    }
    foundRecord.value = results;
    update();
  }
}
