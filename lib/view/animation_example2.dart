import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CircleSide { left, right }

class AnimationExample2 extends StatelessWidget {
  const AnimationExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Example 2')),
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(color: Colors.amberAccent),
              ),
              Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(color: Colors.blueAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
