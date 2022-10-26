import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class wholeAppSocialMediaButtons extends StatelessWidget {
  const wholeAppSocialMediaButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(Whole_icons.facebook),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                backgroundColor:
                    MaterialStateProperty.all(KAccentGreen), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return KWhiteSplash; // <-- Splash color
                }),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Facebook',
              style: regularTextStyle(14),
            )
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(Whole_icons.twitter),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                backgroundColor:
                    MaterialStateProperty.all(KAccentGreen), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return KWhiteSplash; // <-- Splash color
                }),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Twitter',
              style: regularTextStyle(14),
            )
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(Whole_icons.google),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                backgroundColor:
                    MaterialStateProperty.all(KAccentGreen), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return KWhiteSplash; // <-- Splash color
                }),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Google',
              style: regularTextStyle(14),
            )
          ],
        ),
      ],
    );
  }
}
