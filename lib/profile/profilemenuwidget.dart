import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class Profilemenuwidget extends StatelessWidget {
  const Profilemenuwidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListTile(
        onTap: onPress,
       leading: Container(
         width: 30,
         height: 30,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(100),
           color: Colors.grey.withOpacity(0.1),
    
         ),
         child: Icon(icon,
         color: Pallete.color2),
         
       ),
       title: Text(title,
       style: TextStyle(
         fontSize: 15,
         color: Colors.white
         
       ).apply(color: textColor),),
       trailing: endIcon? Container(
         width: 30,
         height: 30,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(100),
           color: Colors.grey.withOpacity(0.1),
         ),
         child: Icon(LineAwesomeIcons.angle_right,
         size: 10,
         color: Colors.grey,),
       ) : null
      ),
    );
  }
}