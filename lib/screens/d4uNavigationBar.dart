import 'package:drone4u/constant/constant.dart';
import 'package:flutter/material.dart';
import '../components/d4uIndex.dart';

class D4uNavigationBar extends StatefulWidget {
  const D4uNavigationBar({super.key});

  @override
  State<D4uNavigationBar> createState() => _D4uNavigationBarState();
}

class _D4uNavigationBarState extends State<D4uNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return D4uScaffold(
      color: d4uBackground,
      expandedHeight: 160,
      flexibleSpaceWidget: FlexibleSpaceBar(
        title: const Text('Drone4U'),
        titlePadding: D4uPadding.a24,
        background: Image.asset(
          'assets/mainPageImage.jpg',
          fit: BoxFit.cover,
        ),
      ),
      bottomNavigationBarWidget: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
