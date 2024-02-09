import 'package:flutter/material.dart';
import 'package:krish/support/theme/theme.dart';

class MenuItem extends StatelessWidget {
  final String  iconLabel;
  final IconData iconData;
  final Function()? onPressed;

  MenuItem({super.key, required this.iconData, required this.iconLabel, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed != null
          ? () {
              onPressed!();
            }
          : () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical:10),
         height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colors(context).primary!.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 17),
                child:Icon(iconData,size: 20, color: colors(context).text,)
                
              
              ),
              Text(
                iconLabel,
                style: const TextStyle(fontSize: 15),
              ),Spacer()
              ,
              Icon(Icons.arrow_right,color: colors(context).text)
            ],
          ),
        ),
      ),
    );
  }
}
