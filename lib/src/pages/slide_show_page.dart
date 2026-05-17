import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prof_design_app/src/widgets/show_slider.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ShowSlider(
            showDots: false,
            slides: [
              SvgPicture.asset('assets/slides/slide-4.svg'),
              SvgPicture.asset('assets/slides/slide-5.svg'),
              Center(child: Text('End')),
            ],
          ),
          ShowSlider(
            slides: [
              SvgPicture.asset('assets/slides/slide-1.svg'),
              SvgPicture.asset('assets/slides/slide-2.svg'),
              SvgPicture.asset('assets/slides/slide-3.svg'),
              SvgPicture.asset('assets/slides/slide-4.svg'),
              Center(child: Text('End')),
            ],
          ),
          ShowSlider(
            slides: [
              SvgPicture.asset('assets/slides/slide-3.svg'),
              SvgPicture.asset('assets/slides/slide-4.svg'),
              SvgPicture.asset('assets/slides/slide-5.svg'),
              Center(child: Text('End')),
            ],
          ),
        ],
      ),
    );
  }
}
