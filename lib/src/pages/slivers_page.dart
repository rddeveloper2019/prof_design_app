import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SliversPage extends StatelessWidget {
  const SliversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _BoxList(),
      //body:  _Title(),
      body: Stack(children: [_MainScroll(), _NewListButton()]),
    );
  }
}

class _NewListButton extends StatelessWidget {
  const _NewListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
          ),
          child: Text(
            'OK OK OK',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 38, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverAppBar(backgroundColor: Colors.red, title: Text('Kola Mondo')),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...List.generate(10, (i) => _Box()),
            SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: _Title());
  }

  @override
  double get maxExtent => 220;

  @override
  double get minExtent => 180;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class _BoxList extends StatelessWidget {
  const _BoxList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext ctx, int idx) {
        return SliverToBoxAdapter(child: _Box());
      },
    );
  }
}

class _Box extends StatelessWidget {
  const _Box({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Color.fromRGBO(random(), random(), random(), 1);
    return FadeInLeft(
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Text(
          color.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'New',
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                decoration: BoxDecoration(color: Color(0xfff7cdd5)),
              ),
            ),
            Container(
              child: Text(
                'List',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffd93a30),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

int random() {
  return Random().nextInt(200);
}
