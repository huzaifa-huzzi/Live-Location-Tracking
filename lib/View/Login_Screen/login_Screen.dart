import 'package:dart_location_app/Provider/Login_Screen%20Provider.dart';
import 'package:dart_location_app/Resources/InputTextFormField.dart';
import 'package:dart_location_app/Resources/RoundButton2.dart';
import 'package:dart_location_app/Resources/colors.dart';
import 'package:dart_location_app/utills/Routes/Routes%20Name.dart';
import 'package:dart_location_app/utills/generalUtills.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    usernameFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
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
                Text('Log in',style: Theme.of(context).textTheme.titleLarge!.copyWith(),),
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
                                  GeneralUtils.focusftn(context, emailFocusNode, usernameFocusNode,);
                                }, icondata: Icons.email,),
                                const SizedBox(height: 30,),
                                InputTextForm(myController: usernameController, focusNode:usernameFocusNode , onValidator: (value){
                                  if(value!.isEmpty){
                                    return 'Enter username';
                                  }
                                }, hint: 'username', keyBoardType: TextInputType.emailAddress,obsecureText: false, onfieldSubmitted: (_){
                                  GeneralUtils.focusftn(context, usernameFocusNode, passwordFocusNode,);
                                }, icondata: Icons.supervised_user_circle_rounded,),
                                const SizedBox(height: 30,),
                                InputTextForm(myController: passwordController, focusNode:passwordFocusNode , onValidator: (value){
                                  if(value!.isEmpty){
                                    return 'Enter Password';
                                  }
                                }, hint: 'Password', keyBoardType: TextInputType.emailAddress, obsecureText: true, onfieldSubmitted: (_){}, icondata: Icons.lock,),
                                const SizedBox(height: 30,),
                              ],
                            ),
                          )),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RoutesName.register);
                    },
                    child: Text.rich(
                      TextSpan(
                          text: 'Dont Have an Account ?',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
                          children:const [
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(fontSize: 21,color: Colors.blue),
                            )
                          ]
                      ),
                    ),
                  ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding:const  EdgeInsets.only(bottom: 40),
                        child: Consumer<LoginProvider>(builder: (context,Provider,child){
                          return   RoundButton2(title: 'Login',loading:Provider.loading,onpress: (){
                            if(_formkey.currentState!.validate()){

                            }
                            Provider.loginFtn(emailController.text.toString(), passwordController.text.toString(),usernameController.text.toString() ,context);
                          });

                        }),
                      ),
                     Padding(
                          padding:const  EdgeInsets.only(left: 240,bottom: 300),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context,RoutesName.forgotPassword );
                            },
                            child: Text.rich(
                              TextSpan(
                                text: 'Forgot Password ?',
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                              ),


                            ),
                          ),
                        ),
                    ],
                  ),
                )

              ]

          ),
        ),
      ),
    );
  }
}
