import 'package:flutter/material.dart';

class forgetpasswordwidget extends StatelessWidget {
  const forgetpasswordwidget({
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final IconData btnIcon;
  final String title,subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 60,
            color: Colors.white,),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(title,
               style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
               ),),
               Text(subtitle,
               style: TextStyle(
                color: Colors.white
               ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}