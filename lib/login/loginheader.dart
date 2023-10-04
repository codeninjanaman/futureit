import 'package:flutter/material.dart';
class loginheader extends StatelessWidget {
  const loginheader({
    super.key,
    required this.size,
    required this.image,
    required this.title,
    required this.subTitle
    
  });

  final Size size;
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(image),
    height: size.height*0.15,),
    Text(title,style: TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.bold
    ),),
    Text(subTitle,style: TextStyle(
      fontSize: 15,
      color: Colors.white,
      
    ),),
      ],
    );
  }
}