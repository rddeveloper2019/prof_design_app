import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prof_design_app/src/models/layout_model.dart';
import 'package:prof_design_app/src/routes/routes.dart';
import 'package:prof_design_app/src/theme/theme.dart';
import 'package:provider/provider.dart';

class ListOptions extends StatelessWidget {
  const ListOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutModel = Provider.of<LayoutModel>(context);
    final appTheme = Provider.of<ThemeChanger>(context);
    final reverseColor = appTheme.darkTheme
        ? appTheme.currentTheme.primaryColorLight
        : appTheme.currentTheme.primaryColorDark;
    return ListView.separated(
      itemCount: pageRoutes.length,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        final pageRoute = pageRoutes[index];
        return ListTile(
          dense: true,
          onTap: () {
            layoutModel.navigate(context, pageRoute.page);
          },
          leading: FaIcon(pageRoute.icon, color: reverseColor),
          title: Text(
            pageRoute.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: reverseColor,
            ),
          ),
          trailing: FaIcon(FontAwesomeIcons.chevronRight, color: reverseColor),
        );
      },
    );
  }
}
