import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prof_design_app/src/pages/animated_cube_page.dart';
import 'package:prof_design_app/src/pages/animated_do_page.dart';
import 'package:prof_design_app/src/pages/emergency_page.dart';
import 'package:prof_design_app/src/pages/headers_page.dart';
import 'package:prof_design_app/src/pages/navigation_page.dart';
import 'package:prof_design_app/src/pages/pinterest_page.dart';
import 'package:prof_design_app/src/pages/radial_progress_page.dart';
import 'package:prof_design_app/src/pages/shoes_app_page.dart';
import 'package:prof_design_app/src/pages/slide_show_page.dart';
import 'package:prof_design_app/src/pages/slivers_page.dart';
import 'package:prof_design_app/src/pages/twitter_page.dart';

final List<Route> pageRoutes = [
  Route(
    icon: FontAwesomeIcons.slideshare,
    title: 'Slideshow',
    page: const SlideShowPage(),
  ),
  Route(
    icon: FontAwesomeIcons.truckMedical,
    title: 'Emergency',
    page: const EmergencyPage(),
  ),
  Route(
    icon: FontAwesomeIcons.heading,
    title: 'Headers',
    page: const HeadersPage(),
  ),
  Route(
    icon: FontAwesomeIcons.peopleCarryBox,
    title: 'AnimatedCube',
    page: const AnimatedCubePage(),
  ),
  Route(
    icon: FontAwesomeIcons.circleNotch,
    title: 'RadialProgress',
    page: const RadialProgressPage(),
  ),
  Route(
    icon: FontAwesomeIcons.pinterest,
    title: 'Pinterest',
    page: const PinterestPage(),
  ),
  Route(
    icon: FontAwesomeIcons.twitter,
    title: 'Twitter',
    page: const TwitterPage(),
  ),
  Route(
    icon: FontAwesomeIcons.mobileScreen,
    title: 'Slivers',
    page: const SliversPage(),
  ),
  Route(
    icon: FontAwesomeIcons.map,
    title: 'Navigation',
    page: const NavigationPage(),
  ),
  Route(
    icon: FontAwesomeIcons.gofore,
    title: 'AnimateDo',
    page: const AnimateDoPage(),
  ),
  Route(
    icon: FontAwesomeIcons.shop,
    title: 'Shoes App',
    page: const ShoesAppPage(),
  ),
];

class Route {
  final FaIconData icon;
  final String title;
  final Widget page;

  Route({required this.icon, required this.title, required this.page});
}
