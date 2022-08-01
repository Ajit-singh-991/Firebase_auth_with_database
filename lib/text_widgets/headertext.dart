import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
 final double size;
  final String text;
  final Color color;
   const HeaderText({Key? key,
     required this.color,
    required this.text,
     this.size = 30,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.bold
      ),
    );
  }
}