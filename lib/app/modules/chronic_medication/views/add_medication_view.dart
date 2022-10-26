import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/style.dart';

import '../controllers/add_medication_controller.dart';

class AddMedicationView extends GetView<AddMedicationController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMedicationController>(builder: (controller) {
      return WholeAppScaffold(
          body: Container(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add New Madication',
                  style: boldTextStyle(25),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Medication',
                  style: regularTextStyle(14),
                ),
                // Form(
                //     key: _formKey,
                //     child: DropdownButtonFormField2(
                //       hint: const Text(
                //         'Select Your Gender',
                //         style: TextStyle(fontSize: 14),
                //       ),
                //       items: [],
                //     ))
              ],
            ),
          ),
          hasAppBar: true);
    });
  }
}
