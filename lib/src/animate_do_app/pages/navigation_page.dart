import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return NotificationModel();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          title: Text('Navigation Page'),
        ),
        floatingActionButton: FloatingButton(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final int number = Provider.of<NotificationModel>(context, listen: false).number;
        final AnimationController? bounceController = Provider.of<NotificationModel>(
          context,
          listen: false,
        ).bounceController;

        Provider.of<NotificationModel>(context, listen: false).number = number > 9 ? 1 : number + 1;
        bounceController?.forward(from: 0.0);
      },
      child: FaIcon(FontAwesomeIcons.gofore),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final int number = Provider.of<NotificationModel>(context).number;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.bone,
            size: 30,
          ),
          label: 'Bone',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              FaIcon(
                FontAwesomeIcons.bell,
                size: 30,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: BounceInDown(
                  from: 10,
                  animate: number > 0,
                  child: Bounce(
                    from: 10,
                    controller: (controller) {
                      Provider.of<NotificationModel>(context, listen: false).bounceController = controller;
                    },
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                      child: Text(
                        number > 9 ? '9+' : number.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          label: 'Bell',
        ),

        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.dog,
            size: 30,
          ),
          label: 'Dog',
        ),
      ],
    );
  }
}

class NotificationModel extends ChangeNotifier {
  int _number = 0;
  AnimationController? _bounceController;

  int get number => _number;
  AnimationController? get bounceController => _bounceController;

  set number(int value) {
    _number = value;
    notifyListeners();
  }

  set bounceController(AnimationController value) {
    _bounceController ??= value;
  }
}
