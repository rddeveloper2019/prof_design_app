import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prof_design_app/src/pages/animated_cube_page.dart';
import 'package:prof_design_app/src/pages/animated_do_page.dart';
import 'package:prof_design_app/src/pages/emergency_page.dart';
import 'package:prof_design_app/src/pages/headers_page.dart';
import 'package:prof_design_app/src/pages/navigation_page.dart';
import 'package:prof_design_app/src/pages/pinterest_page.dart';
import 'package:prof_design_app/src/pages/radial_progress_page.dart';
import 'package:prof_design_app/src/pages/slide_show_page.dart';
import 'package:prof_design_app/src/pages/slivers_page.dart';
import 'package:prof_design_app/src/pages/twitter_page.dart';

final List<Route> pageRoutes = [
  Route(icon: FontAwesomeIcons.slideshare, title: 'Slideshow', page: SlideShowPage()),
  Route(icon: FontAwesomeIcons.truckMedical, title: 'Emergency', page: EmergencyPage()),
  Route(icon: FontAwesomeIcons.heading, title: 'Headers', page: HeadersPage()),
  Route(icon: FontAwesomeIcons.peopleCarryBox, title: 'AnimatedCube', page: AnimatedCubePage()),
  Route(icon: FontAwesomeIcons.circleNotch, title: 'RadialProgress', page: RadialProgressPage()),
  Route(icon: FontAwesomeIcons.pinterest, title: 'Pinterest', page: PinterestPage()),
  Route(icon: FontAwesomeIcons.twitter, title: 'Twitter', page: TwitterPage()),
  Route(icon: FontAwesomeIcons.mobileScreen, title: 'Slivers', page: SliversPage()),
  Route(icon: FontAwesomeIcons.map, title: 'Navigation', page: NavigationPage()),
  Route(icon: FontAwesomeIcons.gofore, title: 'AnimateDo', page: AnimateDoPage()),
];

class Route {
  final FaIconData icon;
  final String title;
  final Widget page;

  Route({required this.icon, required this.title, required this.page});
}
