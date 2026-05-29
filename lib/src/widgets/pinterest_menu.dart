import 'package:flutter/material.dart';

class PinterestMenu extends StatefulWidget {
  final bool hidden;
  const PinterestMenu({super.key, this.hidden = false});

  @override
  State<PinterestMenu> createState() => _PinterestMenuState();
}

class _PinterestMenuState extends State<PinterestMenu> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<PinterestMenuButton> items = [
      PinterestMenuButton(
        icon: Icons.pie_chart,
        onPress: () {
          currentIndex = 0;
          setState(() {});
          print('pie_chart');
        },
      ),
      PinterestMenuButton(
        icon: Icons.search,
        onPress: () {
          currentIndex = 1;
          setState(() {});
          print('search');
        },
      ),
      PinterestMenuButton(
        icon: Icons.notifications,
        onPress: () {
          currentIndex = 2;
          setState(() {});
          print('notifications');
        },
      ),
      PinterestMenuButton(
        icon: Icons.supervised_user_circle,
        onPress: () {
          currentIndex = 3;
          setState(() {});
          print('supervised_user_circle');
        },
      ),
    ];
    return Positioned(
      bottom: 30,
      child: AnimatedOpacity(
        opacity: widget.hidden ? 0 : 1,
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(230),
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              const BoxShadow(
                color: Colors.black38,
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: -5,
              ),
            ],
          ),
          child: MenuBackground(items: items, currentIndex: currentIndex),
        ),
      ),
    );
  }
}

class PinterestMenuButton extends StatelessWidget {
  final void Function() onPress;
  final IconData icon;
  const PinterestMenuButton({
    super.key,
    required this.onPress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPress, icon: Icon(icon));
  }
}

class MenuBackground extends StatelessWidget {
  final List<PinterestMenuButton> items;
  final int currentIndex;
  const MenuBackground({
    super.key,
    required this.items,
    required this.currentIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        items.length,
        (i) => PinterestMenuItem(i, items[i], i == currentIndex),
      ),
    );
  }
}

class PinterestMenuItem extends StatelessWidget {
  final int index;
  final PinterestMenuButton item;
  final bool isActive;

  const PinterestMenuItem(this.index, this.item, [this.isActive = false]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onPress,
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(5.0),
        duration: const Duration(milliseconds: 500),
        child: Icon(
          item.icon,
          color: isActive ? Colors.black87 : Colors.blueGrey,
          size: isActive ? 30 : 28,
        ),
      ),
    );
  }
}
