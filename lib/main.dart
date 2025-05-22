import 'package:animation_example1/view/animation_example1.dart';
import 'package:animation_example1/view/animation_example2.dart';
import 'package:animation_example1/view_model/animation2_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => Animation2ViewModel()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,

            home: const AnimationExample2(),
          ),
        );
      },
    );
  }
}
