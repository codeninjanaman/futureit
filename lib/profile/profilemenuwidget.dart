import 'package:flutter/material.dart';
import 'package:futureit/constants.dart';
import 'package:google_fonts/google_fonts.dart';
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
      height: 45,
      child: ListTile(
        onTap: onPress,
       leading: Container(
         width: 30,
         height: 30,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(100),
          //  color: Colors.grey.withOpacity(0.1),
    
         ),
         child: Icon(icon,
         size: 20,
         color: Pallete.yellow1),
         
       ),
       title: Text(title,
       style: GoogleFonts.inter(
        textStyle: TextStyle(
         fontSize: 12,
         color: Pallete.black
         
       )
       )
       .apply(color: textColor),),
       trailing: endIcon? Container(
         width: 30,
         height: 30,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(100),
          //  color: Colors.grey.withOpacity(0.1),
         ),
         child: Icon(LineAwesomeIcons.angle_right,
         size: 10,
         color: Pallete.black,),
       ) : null
      ),
    );
  }
}