import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    _animation = Tween(begin: 0.0, end: 2 * pi).animate(_controller);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
