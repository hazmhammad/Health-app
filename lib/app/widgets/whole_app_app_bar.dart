import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/constants/constants.dart';

class WholeAppAppBar extends StatelessWidget {
  final title;
  const WholeAppAppBar({
    Key? key,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Get.currentRoute != Routes.HOME
        ? PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: AppBar(
              backgroundColor: kMidGray,
              automaticallyImplyLeading: false,
              actions: [
                Ink(
                  color: KAccentGreen,
                  child: Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu),
                      iconSize: 40,
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                ),
              ],
              leading: Builder(
                builder: (BuildContext context) {
                  final ScaffoldState? scaffold = Scaffold.maybeOf(context);
                  final ModalRoute<Object?>? parentRoute =
                      ModalRoute.of(context);
                  final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
                  final bool canPop = parentRoute?.canPop ?? false;

                  if (hasEndDrawer && canPop) {
                    return BackButton();
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              centerTitle: false,
              title: Text(title),
            ),
          )
        : PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: AppBar(
              backgroundColor: kMidGray,
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: Text(title),
              actions: [
                Ink(
                  color: KAccentGreen,
                  child: Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.menu),
                      iconSize: 40,
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
