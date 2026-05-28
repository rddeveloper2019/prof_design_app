import 'package:flutter/material.dart';

class ShoeCard extends StatelessWidget {
  final bool fullScreen;
  const ShoeCard({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fullScreen ? 5 : 30.0, vertical: 5),
      child: Container(
        width: double.infinity,
        height: fullScreen ? 410 : 430,
        decoration: BoxDecoration(
          color: const Color(0xfff8d468),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const Hero(tag: 'ShoeCard', child: ShoeShadowed()),
                if (!fullScreen) const Expanded(child: ShoeSizes()),
              ],
            ),
            if (fullScreen)
              Positioned(
                top: 60,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.chevron_left, size: 50, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ShoeSizes extends StatelessWidget {
  const ShoeSizes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ShoeSizeBox(
            shoeSize: 7,
          ),
          ShoeSizeBox(
            shoeSize: 7.5,
          ),
          ShoeSizeBox(
            shoeSize: 8,
          ),
          ShoeSizeBox(
            shoeSize: 8.5,
          ),
          ShoeSizeBox(
            shoeSize: 9,
            selected: true,
          ),
          ShoeSizeBox(
            shoeSize: 10,
          ),
        ],
      ),
    );
  }
}

class ShoeSizeBox extends StatelessWidget {
  final double shoeSize;
  final bool selected;
  const ShoeSizeBox({
    super.key,
    required this.shoeSize,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: selected ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [if (selected) BoxShadow(color: Color(0xfff1a23a), blurRadius: 10, offset: Offset(0, 5))],
      ),
      child: Center(
        child: Text(
          shoeSize.toStringAsFixed(1).replaceFirst('.0', ''),
          style: TextStyle(color: selected ? Colors.white : Colors.orange, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ShoeShadowed extends StatelessWidget {
  const ShoeShadowed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(bottom: 20, right: 0, child: ShowShadow()),
          Image.asset('assets/images/azul.png'),
        ],
      ),
    );
  }
}

class ShowShadow extends StatelessWidget {
  const ShowShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          // color: Colors.orange,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [BoxShadow(color: Color(0xffeaa14e), blurRadius: 40)],
        ),
      ),
    );
  }
}
