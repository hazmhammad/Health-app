import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/modules/passwordResetConfirm/views/password_reset_confirm_view.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/app/widgets/widgets.dart';
import '../../../../constants/constants.dart';
import '../controllers/password_reset_controller.dart';

class PasswordResetView extends StatefulWidget{
  @override
  State<PasswordResetView> createState() => _PasswordResetViewState();
}

class _PasswordResetViewState extends State<PasswordResetView> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  PasswordResetController.to.emailController.text = "";
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WholeAppScaffold(
        hasAppBar: false,
        body: Form(
          key: PasswordResetController.to.resetPasswordFormKey,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: width, minHeight: height),
              child: IntrinsicHeight(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          iWhole,
                          height: 80,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Reset your password',
                          style: boldTextStyle(20),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'In order to reset your password, \n please enter your email address',
                            style: regularTextStyle(16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email address',
                            style: regularTextStyle(14),
                          ),
                        ),
                        SizedBox(height: 10),
                        BuildEmailTextField(controller: PasswordResetController.to.emailController,)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        WholeAppButton(
                            text: 'reset password'.toUpperCase(),
                            onPressed: () async {
                              // controller.sendEmail();
                              if(PasswordResetController.to.checkFormReset()){
                                if(await PasswordResetController.to.sendEmail()){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordResetConfirmView(email:  PasswordResetController.to.emailController.text, message: PasswordResetController.to.message.value) ));
                                }
                              }
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        WholeAppOutlinedButton(
                            text: 'back'.toUpperCase(),
                            onPressed: () {
                              Get.back();
                            })
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
        ));
  }
}
