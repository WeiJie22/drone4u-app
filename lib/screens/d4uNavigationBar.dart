import 'package:drone4u/components/d4uIndex.dart';
import 'package:flutter/material.dart';

class D4uNavigationBar extends StatefulWidget {
  const D4uNavigationBar({super.key});

  @override
  State<D4uNavigationBar> createState() => _D4uNavigationBarState();
}

class _D4uNavigationBarState extends State<D4uNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: '')
        ],
      ),
      body: Container(
        child: D4uTextField(),
      ),
    );
  }
}
