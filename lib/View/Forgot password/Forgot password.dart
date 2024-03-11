import 'package:dart_location_app/Provider/Forgot%20password.provider.dart';
import 'package:dart_location_app/Resources/InputTextFormField.dart';
import 'package:dart_location_app/Resources/RoundButton2.dart';
import 'package:dart_location_app/Resources/colors.dart';
import 'package:dart_location_app/utills/generalUtills.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  final emailFocusNode = FocusNode();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    emailFocusNode.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration:const  BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100),),
                ),
                child:const  Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.indigoAccent,
                        radius: 80,
                        child: Center(child: Icon(Icons.person,size: 100,color:Appcolors.logosColor,))),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Text('Forgot password ?',style: Theme.of(context).textTheme.titleLarge!.copyWith(),),
              Padding(
                padding:const  EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                        key: _formkey,
                        child: Padding(
                          padding:const  EdgeInsets.symmetric(horizontal: 20,),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InputTextForm(myController: emailController, focusNode:emailFocusNode , onValidator: (value){
                                if(value!.isEmpty){
                                  return 'Enter email';
                                }
                              }, hint: 'email', keyBoardType: TextInputType.emailAddress,obsecureText: false, onfieldSubmitted: (_){
                                GeneralUtils.focusftn(context, emailFocusNode, emailFocusNode,);
                              }, icondata: Icons.email,),
                              const SizedBox(height: 30,),
                            ],
                          ),
                        )),
                    const SizedBox(height: 10,),
                    Padding(
                      padding:const  EdgeInsets.only(bottom: 40),
                      child: Consumer<ForgotPasswordProvider>(builder: (context,Provider,child){
                        return   RoundButton2(title: 'Reset',loading:Provider.loading,onpress: (){
                          if(_formkey.currentState!.validate()){

                          }
                         Provider.forgotPasswordFtn(context, emailController.text.toString());
                        });

                      }),
                    ),
                  ],
                ),
              )

            ]

        ),
      ),

    );
  }
}
