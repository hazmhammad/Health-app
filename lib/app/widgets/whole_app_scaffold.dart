import 'package:flutter/material.dart';
import 'package:whole/app/widgets/whole_app_drawer.dart';
import 'package:whole/app/widgets/widgets.dart';

class WholeAppScaffold extends StatelessWidget {
  final Widget body;
  final title;
  final hasAppBar;

  const WholeAppScaffold({
    Key? key,
    required this.body,
    this.title = '',
    required this.hasAppBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hasAppBar) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        drawer: WholeAppDrawer(),
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: WholeAppAppBar(

              title: title,
            )),
        endDrawer: WholeAppDrawer(),
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
          child: SafeArea(child: body),
        ),
      );
    } else {
      return Scaffold(
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
          child: SafeArea(child: body),
        ),
      );
    }
  }
}
