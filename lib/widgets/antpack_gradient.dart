import 'package:flutter/material.dart';

class antpackGradient extends StatelessWidget {
  String titulo;
  antpackGradient(this.titulo);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pink, Colors.red], tileMode: TileMode.clamp)),
      child: Positioned(
        left: 400,
        top: 100.0,
        child: Text(
          titulo,
          style: TextStyle(
              color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      alignment: const Alignment(0, -0.8),
    );
  }
}
