import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Animation<double> _xAnimation;
  late Animation<double> _yAnimation;
  late Animation<double> _zAnimation;
  static const widthAndHeight = 100.0;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );

    // Define animations using Tween
    _xAnimation = Tween<double>(begin: 0, end: pi * 2).animate(_xController);
    _yAnimation = Tween<double>(begin: 0, end: pi * 2).animate(_yController);
    _zAnimation = Tween<double>(begin: 0, end: pi * 2).animate(_zController);

    // Start the animations
    _xController.repeat();
    _yController.repeat();
    _zController.repeat();
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Square 3D Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _xController,
            _yController,
            _zController,
          ]),
          builder:
              (context, child) => Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..setEntry(3, 2, 0.001) // Adds perspective
                      ..rotateX(_xAnimation.value)
                      ..rotateY(_yAnimation.value)
                      ..rotateZ(_zAnimation.value),
                child: Stack(
                  children: [
                    // Back Side
                    Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.identity()
                            ..translate(Vector3(0, 0, -widthAndHeight)),
                      child: Container(
                        height: widthAndHeight.h,
                        width: widthAndHeight.w,
                        decoration: BoxDecoration(color: Colors.green),
                      ),
                    ),
                    //left Side
                    Transform(
                      alignment: Alignment.centerLeft,
                      transform: Matrix4.identity()..rotateY(pi / 2.0),
                      child: Container(
                        height: widthAndHeight.h,
                        width: widthAndHeight.w,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                    ),
                    //Right side
                    Transform(
                      alignment: Alignment.centerRight,
                      transform: Matrix4.identity()..rotateY(-pi / 2.0),
                      child: Container(
                        height: widthAndHeight.h,
                        width: widthAndHeight.w,
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                    ),
                    // Front side
                    Container(
                      height: widthAndHeight.h,
                      width: widthAndHeight.w,
                      decoration: BoxDecoration(color: Colors.purple),
                    ),
                    //Top side
                    Transform(
                      alignment: Alignment.topCenter,
                      transform: Matrix4.identity()..rotateX(-pi / 2.0),
                      child: Container(
                        height: widthAndHeight.h,
                        width: widthAndHeight.w,
                        decoration: BoxDecoration(color: Colors.orange),
                      ),
                    ),
                    // //bottom side
                    Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()..rotateX(pi / 2.0),
                      child: Container(
                        height: widthAndHeight.h,
                        width: widthAndHeight.w,
                        decoration: BoxDecoration(color: Colors.brown),
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
