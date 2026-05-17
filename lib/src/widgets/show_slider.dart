import 'package:flutter/material.dart';

class ShowSlider extends StatefulWidget {
  final List<Widget> slides;
  final bool showDots;

  const ShowSlider({super.key, required this.slides, this.showDots = true});

  @override
  State<ShowSlider> createState() => _ShowSliderState();
}

class _ShowSliderState extends State<ShowSlider> {
  int activeIndex = 0;

  final PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: PageView.builder(
                itemCount: widget.slides.length,
                onPageChanged: (int idx) {
                  setState(() {
                    activeIndex = idx;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return widget.slides[index];
                },
              ),
            ),
          ),
          if (widget.showDots)
            _Dots(length: widget.slides.length, activeIndex: activeIndex),
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int length;
  final int activeIndex;
  const _Dots({required this.length, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (int idx) => _Dot(isActive: idx == activeIndex),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isActive;
  const _Dot({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 3),
      width: isActive ? 14 : 12,
      height: isActive ? 14 : 12,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.grey,
        shape: BoxShape.circle,
      ),
      duration: Duration(milliseconds: 300),
    );
  }
}
