import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:prof_design_app/src/models/layout_model.dart';
import 'package:prof_design_app/src/theme/theme.dart';
import 'package:prof_design_app/src/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatefulWidget {
  const PinterestPage({super.key});

  @override
  State<PinterestPage> createState() => _PinterestPageState();
}

class _PinterestPageState extends State<PinterestPage> {
  int currentIndex = 0;
  bool menuHidden = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PinterestGrid(
            onScroll: (hidden) {
              setState(() {
                menuHidden = hidden;
              });
            },
          ),

          PinterestMenu(hidden: menuHidden),
        ],
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  void Function(bool value)? onScroll;
  PinterestGrid({super.key, this.onScroll});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final ScrollController scrollController = ScrollController();
  final List<int> items = List.generate(200, (i) => i);
  double scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.onScroll == null) {
        return;
      }
      if (scrollController.offset < scrollOffset) {
        widget.onScroll!(true);
      } else {
        widget.onScroll!(false);
      }
      scrollOffset = scrollController.offset;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: scrollController,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => PinterestItem(index: index),
      staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class PinterestItem extends StatelessWidget {
  final int index;
  const PinterestItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final reverseColor = appTheme.darkTheme
        ? appTheme.currentTheme.primaryColorLight
        : appTheme.currentTheme.primaryColorDark;
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: reverseColor,
        borderRadius: BorderRadius.circular(30),
      ),

      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}
