import 'package:animation_example1/view/animation_example1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AnimationExample1(),
          ),
    ),
  );
}
