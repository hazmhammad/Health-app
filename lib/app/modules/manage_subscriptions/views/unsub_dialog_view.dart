import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/style.dart';
import '../../../widgets/widgets.dart';
import '../controllers/manage_subscriptions_controller.dart';

class UnsubDialogView extends GetView<ManageSubscriptionsController> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      backgroundColor: Colors.white,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Unsubscribe Successful.',
                style: boldTextStyle(25, kBlackGrey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'You will still be able to enjoy WHOLE app up until Wednesday, 29 March 2020',
                style: regularTextStyle(16, kBlackGrey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 14,
              ),
              WholeAppOutlinedButton(
                  text: 're-subscribe'.toUpperCase(), onPressed: () {}),
              SizedBox(
                height: 20,
              ),
              Text(
                'If you have a moment,please let us know why you unsubscribed:',
                style: boldTextStyle(22, kBlackGrey),
                textAlign: TextAlign.center,
              ),
              GetBuilder<ManageSubscriptionsController>(
                  init: controller,
                  builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Radio(
                                  fillColor:
                                      MaterialStateProperty.all(KAccentGreen),
                                  value: controller.radioCho[0],
                                  groupValue: controller.selectedChoice,
                                  onChanged: (value) =>controller.onChangedChoice(value)),
                            ),
                            Flexible(
                                child: Text(controller.radioCho[0],
                                    style: regularTextStyle(16, kBlackGrey))),
                          ],
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Radio(
                                  value: controller.radioCho[1],
                                  fillColor:
                                      MaterialStateProperty.all(KAccentGreen),
                                  groupValue: controller.selectedChoice,
                                  onChanged: (value) =>controller.onChangedChoice(value)),
                            ),
                            Flexible(
                                child: Text(
                              controller.radioCho[1],
                              style: regularTextStyle(16, kBlackGrey),
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Radio(
                                  value: controller.radioCho[2],
                                  fillColor:
                                      MaterialStateProperty.all(KAccentGreen),
                                  groupValue: controller.selectedChoice,
                                  onChanged: (value) =>controller.onChangedChoice(value)),
                            ),
                            Flexible(
                                child: Text(controller.radioCho[2],
                                    style: regularTextStyle(16, kBlackGrey))),
                          ],
                        ),
                    ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: 170,
                      minWidth: 225,
                    ),
                      child: Container(
                        // TODO add animated container

                        child: TextField(
                          decoration: InputDecoration(
                            hintText:'Type your reason here...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            hintStyle: regularTextStyle(16,kGrayDisBtnB),
                            focusedBorder:  OutlineInputBorder(
                              borderSide: const BorderSide(color: KAccentGreen, width: 2.0),
                              borderRadius: BorderRadius.circular(0),
                            ),


                          ),
                        keyboardType: TextInputType.multiline,
                        minLines: 7,//Normal textInputField will be displayed
                          maxLines: 10,
                          // when user presses enter it will adapt to it

                        ),
                        height: 170,
                      ),
                    )
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
