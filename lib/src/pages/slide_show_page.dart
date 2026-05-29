import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prof_design_app/src/models/layout_model.dart';
import 'package:prof_design_app/src/widgets/show_slider.dart';
import 'package:provider/provider.dart' show Provider;

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutModel = Provider.of<LayoutModel>(context);

    final children = [
      ShowSlider(
        slides: [
          SvgPicture.asset('assets/slides/slide-1.svg'),
          SvgPicture.asset('assets/slides/slide-2.svg'),
          SvgPicture.asset('assets/slides/slide-3.svg'),
          SvgPicture.asset('assets/slides/slide-4.svg'),
          const Center(child: Text('End')),
        ],
      ),
      ShowSlider(
        slides: [
          SvgPicture.asset('assets/slides/slide-3.svg'),
          SvgPicture.asset('assets/slides/slide-4.svg'),
          SvgPicture.asset('assets/slides/slide-5.svg'),
          const Center(child: Text('End')),
        ],
      ),
    ];

    return Scaffold(
      body: layoutModel.isLarge(context)
          ? Row(
              children: children,
            )
          : Column(
              children: children,
            ),
    );
  }
}
