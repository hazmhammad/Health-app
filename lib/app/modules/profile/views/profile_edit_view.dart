import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/models/states.dart';
import 'package:whole/app/modules/MAAP/Models/countries.dart';
import 'package:whole/app/modules/profile/controllers/profile_edit_controller.dart';

import 'package:whole/app/widgets/whole_app_two_buttons.dart';
import 'package:whole/constants/constants.dart';
import 'package:whole/app/widgets/widgets.dart';

class ProfileEditView extends GetView<ProfileEditController> {
  List<String> countries = ["Country 1", "Country 2"];
  List<String> states = ["State 1", "State 2"];
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  String? selectedItem = "Item 1";
  String countryValue = '';
  String stateValue = '';
  String cityValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 81, 77, 96),
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: WholeAppAppBar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 20.0),
          child: Center(
            child: Form(
              key: controller.updateProfileKey,
              child: GetX<ProfileEditController>(
                builder: (ProfileEditController profileEditController) {
                  return Column(
                    children: [
                      Text(
                        "EDIT PERSONAL DETAILS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(children: [
                        Text(
                          "First name",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: controller.firstNameController,
                        validator: (String? value) {
                          return controller.validateAllField(value!);
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 105, 103, 112),
                          hintText: "e.g. John",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 155, 155, 155),
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(children: [
                        Text(
                          "Surname",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: controller.surNameController,
                        validator: (String? value) {
                          return controller.validateAllField(value!);
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 105, 103, 112),
                          hintText: "e.g. Surname",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 155, 155, 155),
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(children: [
                        Text(
                          "Country",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 8.0,
                      ),

                      // Country Dropdown
                      DropdownButtonFormField<Countries>(
                        isExpanded: true,
                        iconEnabledColor: Colors.white,
                        dropdownColor: Color.fromARGB(255, 105, 103, 112),
                        items: profileEditController.countries
                            .map(
                              (item) => DropdownMenuItem(
                                child: Text(
                                  item.name!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                                value: item,
                              ),
                            )
                            .toList(),
                        onChanged: (item) {
                          setState(() => selectedItem = item!.name);
                          controller.selectedCounrty.value = item!.name!;
                          if (item.isoCode != null) {
                            controller.getStates(isoCode: item.isoCode!);
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 105, 103, 112),
                          hintText: "e.g. America",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 155, 155, 155),
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      // TextFormField(
                      //   controller: controller.countryController,
                      //
                      //   validator: (String? value){
                      //     return controller.validateAllField(value!);
                      //   },
                      //   style: TextStyle(color: Colors.white),
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Color.fromARGB(255, 105, 103, 112),
                      //     hintText: "e.g. America",
                      //     hintStyle: TextStyle(
                      //       color: Color.fromARGB(255, 155, 155, 155),
                      //     ),
                      //     border: OutlineInputBorder(borderSide: BorderSide.none),
                      //     contentPadding: EdgeInsets.all(10),
                      //   ),
                      // ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Visibility(
                        visible: controller.states.length != 0,
                        child: Row(
                          children: [
                            Text(
                              "State",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),

                      // TextFormField(
                      //   controller: controller.stateController,
                      //
                      //   validator: (String? value){
                      //     return controller.validateAllField(value!);
                      //   },
                      //   style: TextStyle(color: Colors.white),
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: Color.fromARGB(255, 105, 103, 112),
                      //     hintText: "e.g. State",
                      //     hintStyle: TextStyle(
                      //       color: Color.fromARGB(255, 155, 155, 155),
                      //     ),
                      //     border: OutlineInputBorder(borderSide: BorderSide.none),
                      //     contentPadding: EdgeInsets.all(10),
                      //   ),
                      // ),
                      // State dropdown
                      Visibility(
                        visible: controller.states.length != 0,
                        child: DropdownButtonFormField<States>(
                          isExpanded: true,
                          iconEnabledColor: Colors.white,
                          dropdownColor: Color.fromARGB(255, 105, 103, 112),
                          items: controller.states
                              .map(
                                (item) => DropdownMenuItem(
                                  child: Text(
                                    item.name!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  value: item,
                                ),
                              )
                              .toList(),
                          onChanged: (item) {
                            setState(() => selectedItem = item!.name);
                            controller.selectedState.value = item!.name!;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 105, 103, 112),
                            hintText: "e.g. State",
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 155, 155, 155),
                            ),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(children: [
                        Text(
                          "Mobile number",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextFormField(
                        controller: controller.mobileNumberController,
                        validator: (String? value) {
                          return controller.validateAllField(value!);
                        },
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 105, 103, 112),
                          hintText: "000 000 0000",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 155, 155, 155),
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.all(10),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(children: [
                        Text(
                          "Date of birth",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: controller.dayOfBirthController,
                              validator: (String? value) {
                                return controller.validateAllField(value!);
                              },
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 105, 103, 112),
                                hintText: "dd",
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 155, 155, 155),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ),
                          Flexible(
                            // Months dropdown
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              iconEnabledColor: Colors.white,
                              dropdownColor: Color.fromARGB(255, 105, 103, 112),
                              items: controller.months
                                  .map(
                                    (month) => DropdownMenuItem(
                                      child: Text(
                                        month,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      value: month,
                                    ),
                                  )
                                  .toList(),
                              onChanged: (item) {
                                setState(() => selectedItem = item);
                                controller.selectedMonth.value = item!;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 105, 103, 112),
                                hintText: "month",
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 155, 155, 155),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: controller.yearOfBirthController,
                              validator: (String? value) {
                                return controller.validateAllField(value!);
                              },
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 105, 103, 112),
                                hintText: "yyyy",
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 155, 155, 155),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ),
                          // Calendar Button
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.calendar_month,
                                size: 40.0,
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: KAccentGreen,
                                padding: EdgeInsets.all(4),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      WholeAppTwoButtons(
                        leftButtonText: "CANCEL",
                        rightButtonText: "SAVE",
                        containerHeight: 50.0,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

setState(String? Function() param0) {}
