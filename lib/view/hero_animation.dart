import 'package:animation_example1/view/hero_detail_page.dart';
import 'package:flutter/material.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({super.key});

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero anmimation'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                final person = people[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HeroDetailPage(person: person);
                        },
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Hero(
                      tag: person.name,
                      child: Image.asset(person.image),
                    ),
                    title: Text(
                      person.name,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    subtitle: Text(
                      person.age,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
class Person {
  final name;
  final age;
  final image;

  Person({this.age, this.image, this.name});
}

dynamic people = [
  Person(name: 'Arshad', age: '30', image: 'assets/2.png'),
  Person(name: 'Shehzad', age: '26', image: 'assets/pngegg.png'),
];
