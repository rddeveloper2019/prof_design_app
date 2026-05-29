import 'package:flutter/material.dart';

class PlayerIntro extends StatelessWidget {
  const PlayerIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [_DiscImage(), Spacer(), _ProgressBar()],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '00:00',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 230,
                width: 5,
                decoration: BoxDecoration(color: Colors.white.withAlpha(125), borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                height: 120,
                width: 5,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
        const Text(
          '00:00',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class _DiscImage extends StatefulWidget {
  const _DiscImage({super.key});

  @override
  State<_DiscImage> createState() => _DiscImageState();
}

class _DiscImageState extends State<_DiscImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    // _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xff484750),
              Color(0xff1e1c24),
            ],
          ),
          shape: BoxShape.circle,
        ),
        width: 250,
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: const Image(
                image: AssetImage('assets/images/aurora.jpg'),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [
                    Color(0xff484750),
                    Color(0xff1e1c24),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
