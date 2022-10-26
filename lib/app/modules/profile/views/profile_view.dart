import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/constants/constants.dart';


import '../../../widgets/widgets.dart';
import '../controllers/profile_controller.dart';

import 'profile_edit_view.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 81, 77, 96),

      endDrawer: WholeAppDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          child: WholeAppAppBar(
            title: 'Profile',
          )),
      body: GetX<ProfileController>(
        builder: (ProfileController profileController){
          return profileController.isLoading.value ? Center(child: CircularProgressIndicator(),) : Padding(
            padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 20.0),
            child: Center(
              child: Column(
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/avatar.png"),
                          radius: 50,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(color: Colors.white, width: 1.0),
                        ),
                      ),
                      Positioned(
                        bottom: -10.0,
                        right: -20.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.edit,
                            size: 20.0,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 31, 224, 204),
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    profileController.profile.first.name ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Color.fromARGB(255, 105, 103, 112),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "PERSONAL DETAILS",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                             profileController.profile.first.email ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Mobile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              "001 123 7777",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Location",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              "${profileController.profile.first.country ?? ""
                                  + '${profileController.profile.first.state ?? ""}'
                              }",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Date of Birth",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              profileController.profile.first.birthdate ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 31, 224, 204),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    padding:
                                    EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ProfileEditView();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "EDIT PERSONAL DETAILS",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
