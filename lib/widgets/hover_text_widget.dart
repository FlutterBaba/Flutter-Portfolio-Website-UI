import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {

  final String text;
  final void Function()? onTap;
  
  HoverText({required this.text, required this.onTap });

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {

  Color textColor= Colors.blue;
  int _enterCounter=0;
  int _exitCounter=0;
  double x=0.0;
  double y=0.0;


 void _incrementEnter(PointerEvent details){
   setState(() {
     _enterCounter++;
   });
 }
  void _incrementExit(PointerEvent details){
   setState(() {
     textColor= Colors.blue;
     _exitCounter++;
   });
 }

  void _updateLocation(PointerEvent details){
   setState(() {
     textColor= Colors.red;
     x=details.position.dx;
     y=details.position.dy;
   });
 }




@override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover:_updateLocation ,
      onExit:_incrementExit ,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(widget.text,style: TextStyle(
          fontFamily: "myfont",
          fontWeight: FontWeight.bold,
          color: textColor,
        ),),
      ),
    );
  }
}