import 'package:flutter/material.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 532,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 100,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Flutter"));
          }),
    );
  }
}
