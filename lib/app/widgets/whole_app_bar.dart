import 'package:flutter/material.dart';
import 'package:whole/constants/constants.dart';

class WholeAppBar extends StatelessWidget with PreferredSizeWidget {
  final String titleText;

  const WholeAppBar({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('$titleText'),
      centerTitle: false,
      // titleSpacing: 0.0,
      // automaticallyImplyLeading: false,
      // leading: IconButton(
      //     onPressed: () => Navigator.of(context).pop(),
      //     icon: Icon(Icons.arrow_left)),
      backgroundColor: kMidGray,
      actions: [
        Ink(
          color: KAccentGreen,
          child: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              iconSize: 40,
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
