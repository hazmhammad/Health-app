import 'package:flutter/material.dart';
import 'package:whole/app/widgets/WholeOutlineButton.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/style.dart';

class SubscriptionNoTrialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMidGray,
        actions: [
          InkWell(
              child: Row(
            children: [
              Icon(
                Icons.close,
                size: 30,
              ),
              Text(
                "Close",
                style: regularTextStyle(16),
              ),
              SizedBox(
                width: 20,
              )
            ],
          )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff514D60),
            Color(0xff121113),
          ],
          stops: [0.0, 1.0],
        )),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 0, right: 0, top: 30, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Text("Become WHOLE", style: boldTextStyle(25)),
              ),
              Container(
                  height: 400,
                  //width: double.infinity,
                  child: ListView(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        color: kRed,
                        elevation: 0,
                        child: ListTile(
                          title: Text(
                            "Your 30 Day Free Trail has expired.",
                            style: regularTextStyle(16),
                          ),
                          leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.check_circle_rounded,
                                size: 30,
                                color: Colors.white,
                              )),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        color: Colors.transparent,
                        elevation: 0,
                        child: ListTile(
                          title: Text(
                            "Feature",
                            style: regularTextStyle(16),
                          ),
                          leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.check_circle_rounded,
                                size: 30,
                                color: KAccentGreen,
                              )),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        color: Colors.transparent,
                        elevation: 0,
                        child: ListTile(
                          title: Text(
                            "Feature",
                            style: regularTextStyle(16),
                          ),
                          leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.check_circle_rounded,
                                size: 30,
                                color: KAccentGreen,
                              )),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        color: Colors.transparent,
                        elevation: 0,
                        child: ListTile(
                          title: Text(
                            "Feature",
                            style: regularTextStyle(16),
                          ),
                          leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.check_circle_rounded,
                                size: 30,
                                color: KAccentGreen,
                              )),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        color: Colors.transparent,
                        elevation: 0,
                        child: ListTile(
                          title: Text(
                            "Feature",
                            style: regularTextStyle(16),
                          ),
                          leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.check_circle_rounded,
                                size: 30,
                                color: KAccentGreen,
                              )),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        color: Colors.transparent,
                        elevation: 0,
                        child: ListTile(
                          title: Text(
                            "Feature",
                            style: regularTextStyle(16),
                          ),
                          leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.check_circle_rounded,
                                size: 30,
                                color: KAccentGreen,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: RichText(
                  text: TextSpan(
                    text: 'Try 30 days free,', style: boldTextStyle(14),
                    // style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'then R33.99 / month or R339.83',
                          style: regularTextStyle(14)),
                      TextSpan(
                          text: ' R407.88',
                          style: lineThroughRegularTextStyle(14, kLightGray)),
                      TextSpan(
                          text: '/ year. You can cancel anytime.',
                          style: regularTextStyle(14)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Text("subscribe for:".toUpperCase(),
                    style: boldTextStyle(25)),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(children: [
                  Expanded(
                      child: WholeAppOutlinedButton(
                          text: "R33.99 / MONTH", onPressed: () {})),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: WholeAppButton(
                          text: "R339.83 / YEAR", onPressed: () {})),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
