import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 300, color: Color(0xff615aab));
  }
}

class CircularBordersHeader extends StatelessWidget {
  const CircularBordersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615aab),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _DiagonalHeaderPainter(color: Color(0xff615aab)),
      ),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  final Color _color;

  _DiagonalHeaderPainter({super.repaint, required Color color})
    : _color = color;
  @override
  void paint(Canvas canvas, Size size) {
    //Size(390.0, 844.0)
    final paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TriangleHeader extends StatelessWidget {
  const TriangleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _TriangleHeaderPainter(color: Color(0xff615aab)),
      ),
    );
  }
}

class _TriangleHeaderPainter extends CustomPainter {
  final Color _color;

  _TriangleHeaderPainter({super.repaint, required Color color})
    : _color = color;
  @override
  void paint(Canvas canvas, Size size) {
    //Size(390.0, 844.0)
    final paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PeakHeader extends StatelessWidget {
  const PeakHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(painter: _PeakHeaderPainter(color: Color(0xff615aab))),
    );
  }
}

class _PeakHeaderPainter extends CustomPainter {
  final Color _color;

  _PeakHeaderPainter({super.repaint, required Color color}) : _color = color;
  @override
  void paint(Canvas canvas, Size size) {
    //Size(390.0, 844.0)
    final paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CurvedHeader extends StatelessWidget {
  const CurvedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _CurvedHeaderPainter(color: Color(0xff615aab)),
      ),
    );
  }
}

class _CurvedHeaderPainter extends CustomPainter {
  final Color _color;

  _CurvedHeaderPainter({super.repaint, required Color color}) : _color = color;
  @override
  void paint(Canvas canvas, Size size) {
    //Size(390.0, 844.0)
    final paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.25);

    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.35,
      size.width,
      size.height * 0.25,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WavesHeader extends StatelessWidget {
  const WavesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _WavesHeaderPainter(color: Color(0xff615aab)),
      ),
    );
  }
}

class _WavesHeaderPainter extends CustomPainter {
  final Color _color;

  _WavesHeaderPainter({super.repaint, required Color color}) : _color = color;
  @override
  void paint(Canvas canvas, Size size) {
    //Size(390.0, 844.0)
    final paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.25);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.3,
      size.width * 0.5,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.20,
      size.width,
      size.height * 0.25,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GradientWavesHeader extends StatelessWidget {
  const GradientWavesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(painter: _GradientHeaderPainter()),
    );
  }
}

class _GradientHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: Offset(0, 30), radius: 190);

    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(255, 27, 24, 58),
        Color(0xff615aab),
        Color.fromARGB(255, 142, 134, 228),
        Colors.red,
      ],
      stops: [0, .50, .60, 1],
    );
    //Size(390.0, 844.0)
    final paint = Paint();
    paint.shader = gradient.createShader(rect);
    paint.color = Color(0xff615aab);
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.25);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.3,
      size.width * 0.5,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.20,
      size.width,
      size.height * 0.25,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
