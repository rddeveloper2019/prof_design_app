import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prof_design_app/src/routes/routes.dart';
import 'package:prof_design_app/src/theme/theme.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final reverseColor = appTheme.darkTheme
        ? appTheme.currentTheme.primaryColorLight
        : appTheme.currentTheme.primaryColorDark;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: reverseColor,
        backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
        title: Text(
          'Professional Design App',
          style: TextStyle(color: reverseColor),
        ),
      ),
      drawer: MainMenu(),
      body: ListOptions(),
    );
  }
}

class ListOptions extends StatelessWidget {
  const ListOptions({super.key});

  @override
  Widget build(BuildContext context) {
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
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => pageRoute.page));
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

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final reverseColor = appTheme.darkTheme
        ? appTheme.currentTheme.primaryColorLight
        : appTheme.currentTheme.primaryColorDark;
    return Drawer(
      child: ListTileTheme(
        iconColor: Colors.red,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
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
              Expanded(child: ListOptions()),
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
                leading: FaIcon(FontAwesomeIcons.mobileRetro, color: reverseColor),
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
      ),
    );
  }
}
