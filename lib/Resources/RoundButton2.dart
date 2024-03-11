import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';



class RoundButton2 extends StatelessWidget {
  String title;
  final VoidCallback onpress;
  bool loading ;
   RoundButton2({super.key,required this.title,required this.onpress,this.loading =false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50),
        ),
        child:loading?const LoadingIndicator(indicatorType: Indicator.ballClipRotate,colors: [Colors.white],) : Center(child:Text(title,style: Theme.of(context).textTheme.bodyMedium!.copyWith(),),),
      ),
    );
  }
}
