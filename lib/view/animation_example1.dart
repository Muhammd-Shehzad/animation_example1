import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AnimationExample1 extends StatefulWidget {
  const AnimationExample1({super.key});

  @override
  State<AnimationExample1> createState() => _AnimationExample1State();
}

class _AnimationExample1State extends State<AnimationExample1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    super.initState();
    _animation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCubic));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Example 1'), centerTitle: true),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder:
              (context, child) => Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(_animation.value),
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 100.r,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
