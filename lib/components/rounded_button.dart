
import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  RoundedButton({required this.colour, required this.title, required this.onPressed }) ;

  Color colour;
  String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color:colour,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth:200 ,
          height: 42.0,
          child: Text(title),
        ),
      ),
    );
  }
}
