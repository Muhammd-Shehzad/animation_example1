import 'package:animation_example1/view/hero_animation.dart';
import 'package:flutter/material.dart';

class HeroDetailPage extends StatefulWidget {
  final Person person;
  HeroDetailPage({super.key, required this.person});

  @override
  State<HeroDetailPage> createState() => _HeroDetailPageState();
}

class _HeroDetailPageState extends State<HeroDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Hero(
          tag: widget.person.name,
          child: Image.asset(widget.person.image, width: 50, height: 50),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              widget.person.name,
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              widget.person.age,
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
