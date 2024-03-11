import 'package:flutter/material.dart';



class RoundButton extends StatelessWidget {
  String title;
  final VoidCallback onpress;
   RoundButton({super.key,required this.title,required this.onpress, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          gradient:const   LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors:[
              Colors.indigo,
                Colors.deepPurple,
                Colors.deepOrange
          ]),
          borderRadius: BorderRadius.circular(50),
        ),
        child:Center(child: Text(title,style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),),),
      ),
    );
  }
}
