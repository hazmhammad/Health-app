import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/modules/manage_subscriptions/views/unsub_dialog_view.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/style.dart';

import '../controllers/manage_subscriptions_controller.dart';

class ManageSubscriptionsView extends GetView<ManageSubscriptionsController> {
  @override
  Widget build(BuildContext context) {
    return WholeAppScaffold(
        body: Center(
          child: Padding(

            padding: const EdgeInsets.all(30.0),
            child: ManageSubscriptionsWidget(
              isSubscribed: true,
            ),
          ),
        ),
        hasAppBar: true);
  }
}

class ManageSubscriptionsWidget extends StatelessWidget {
  final bool isSubscribed;

  const ManageSubscriptionsWidget({
    Key? key,
    required this.isSubscribed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSubscribed)
      return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        BigText("You are subscribed to WHOLE Premium."),
        SizedBox(height: 20),
        SmallText(false,
            "You have a monthly WHOLE account subscription. R33.99 will be deducted from your account the 1st of every month."),
        SizedBox(height: 20),
        Container(
            width: double.infinity,
            child: WholeAppOutlinedButton(
                text: "UNSUBSCRIBE",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return UnsubDialogView();
                      });
                })),
        SizedBox(height: 20),
        BigText("Switch to a Yearly Subscription and Save!"),
        SizedBox(height: 20),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
            children: <TextSpan>[
              TextSpan(text: 'Only R339.83 '),
              TextSpan(
                text: 'R407.88',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough),
              ),
              TextSpan(text: ' for 12 months. You can cancel anytime.'),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
            width: double.infinity,
            child: WholeAppButton(
                text: "SUBSCRIBE FOR R339.83 / YEAR", onPressed: () {})),
      ]);
    else
      return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        // SizedBox(height: 30),
        BigText("You are not subscribed."),
        SizedBox(height: 20),
        SmallText(false,
            "You have a free WHOLE account which will end on Wednesday, 29 March 2020."),
        SizedBox(height: 20),
        SmallText(
          false,
          "purchase a WHOLE Premium subscription to access all content and features.",
        ),
        SizedBox(height: 20),
        Container(
            width: double.infinity,
            child: WholeAppButton(text: "GET WHOLE PREMIUM", onPressed: () {})),
      ]);
  }

  Text SmallText(
    bool center,
    String text,
  ) {
    if (center)
      return Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      );

    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }

  Text BigText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
