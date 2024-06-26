

import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {

  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Functions Screen')),
        // leading: const Icon(Icons.refresh), // Muestra a la izquierda
        actions: [ // Muestra a la derecha
          IconButton(
          onPressed: () {
            setState(() {
              clickCounter = 0;
            });
          },
          icon: const Icon( Icons.refresh )
        ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter', style: const TextStyle(fontSize: 100, fontWeight: FontWeight.w100)),
            Text(clickCounter == 1 ? 'Click' : 'Clicks', style: const TextStyle(fontSize: 25))
          ],
        ),
      ),
      floatingActionButton:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           CustomFloatingActionButton(icon: Icons.refresh_outlined, onPressed: (){
            setState(() {
              clickCounter = 0;
            });
           },),

           const SizedBox(height: 10),

           CustomFloatingActionButton(icon: Icons.plus_one_outlined, onPressed: (){
            setState(() {
              clickCounter++;
            });
           },),

           const SizedBox(height: 10),

           CustomFloatingActionButton(icon: Icons.exposure_minus_1_outlined, onPressed: (){
            if(clickCounter == 0) return;
            setState(() {
              clickCounter--;
            });
           }),
        ],
      )
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomFloatingActionButton({
    required this.icon,
    this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon( icon ),
    );
  }
}