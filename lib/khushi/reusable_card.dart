import 'package:flutter/material.dart';
 

class ReusableCard extends StatelessWidget{
  ReusableCard({required this.colour , this.cardChild,});
  // ReusableCard({required this.colour , this.cardChild});
  
  final Color colour ;
  final Widget? cardChild;
  // Function onPress = (){} ;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      
      // onTap : onPress(),
      child: Container(
          
          child: cardChild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colour,
          ),
        ),
    );
  }
}
