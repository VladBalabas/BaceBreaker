import 'package:flutter/material.dart';

class MyRow extends StatefulWidget {
  final String text;
  final IconData icon;
  final soundManager;
  MyRow({required this.text, required this.icon, this.soundManager});

  @override
  _MyRowState createState() => _MyRowState();
}

class _MyRowState extends State<MyRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.soundManager.toggleSound();
            });
          },
          child: Container(
            width: 40,
            height: 40,
            color: widget.soundManager.isSoundOn ? Colors.green : Colors.grey,
            
          ),
        ),
      ],
    );
  }
}

class MyRow1 extends StatefulWidget {
  final String text;
  MyRow1({required this.text,});

  @override
  _MyRow1State createState() => _MyRow1State();
}

class _MyRow1State extends State<MyRow1> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Container(
            width: 40,
            height: 40,
            color: isChecked ? Colors.green : Colors.grey,
            
          ),
        ),
      ],
    );
  }
}
