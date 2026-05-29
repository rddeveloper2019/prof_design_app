import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prof_design_app/src/theme/theme.dart';
import 'package:prof_design_app/src/widgets/list_options.dart';
import 'package:provider/provider.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final reverseColor = appTheme.darkTheme
        ? appTheme.currentTheme.primaryColorLight
        : appTheme.currentTheme.primaryColorDark;
    return SafeArea(
      child: Container(
        color: appTheme.currentTheme.scaffoldBackgroundColor,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              height: 150,
              child: CircleAvatar(
                child: Text(
                  'FH',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: reverseColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const Expanded(child: ListOptions()),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.lightbulb, color: reverseColor),
              title: Text(
                'Dark Mode',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: reverseColor,
                ),
              ),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
                activeTrackColor: reverseColor,
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.mobileRetro,
                color: reverseColor,
              ),
              title: Text(
                'Custom Mode',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: reverseColor,
                ),
              ),
              trailing: Switch.adaptive(
                value: appTheme.customTheme,
                onChanged: (value) {
                  appTheme.customTheme = value;
                },
                activeTrackColor: reverseColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
