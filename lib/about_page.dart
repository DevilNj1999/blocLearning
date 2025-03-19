import 'package:flutter/material.dart';

class About extends StatefulWidget {
  final String name;
  const About({super.key,required this.name});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About us page"),),
      body: Center(
        child: Text("This is about us page  ${widget.name}"),
      ),
    );
  }
}
