

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestHomeScreen extends StatelessWidget {
  const TestHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'I Love You',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 300),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // cont 1
              Container(
                height: 30,
                width: 50,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Child 1', 
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // cont2
              Container(
                height: 30,
                width: 50,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Child 2', 
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // cont 3
              Container(
                height: 30,
                width: 50,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Child 3', 
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // cont 4
              Container(
                height: 30,
                width: 50,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Child 4', 
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



// buttons, containers, row, appbar