// ignore_for_file: library_private_types_in_public_api, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:welcome_screen/pages/Registration_page.dart';
import 'package:welcome_screen/pages/neumorphic_page.dart';





class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{

  final _formKey = GlobalKey<FormState>();

  final bear = "https://c.tenor.com/mRHeooBie4IAAAAi/cute-animals-cute.gif";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
 

  

  
   @override
  Widget build (BuildContext context){

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if(value!.isEmpty)
        {
          return("Please Enter Your Email");
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
        {
          return("Please Enter Your Valid Email");
        }
        return null;
      },
      onSaved:(value){
        emailController.text= value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: const Icon(
          Icons.mail_lock_rounded,
          color: Vx.purple500,
          
          ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Vx.purple500, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      
      ),
    );
    final passwordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passwordController,
      
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return("Please Enter Password");
        }
        if(!regex.hasMatch(value)){
          return("Please Enter Valid Password upto 6 characters");

        }
        return null;
      },
      onSaved:(value){
        passwordController.text= value!;
      },
      textInputAction: TextInputAction.done,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key_off_rounded,
          color: Vx.purple500,
          ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        focusedBorder: OutlineInputBorder(
           borderSide: const BorderSide(color: Vx.purple500, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      
      ),
    );

    return Scaffold(
       backgroundColor: Vx.purple500,
  
  appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: VStack([
      VxBox().size(20, 5).white.make(),
      5.heightBox,
        VxBox().size(15, 4).white.make(),
        5.heightBox,
          VxBox().size(10, 3).white.make(),

    ]).pOnly(left: 16, top: 16),
  ),
  body:  VStack([
    
              
            VxBox(
              
              child: [
                VxBox().square(100).roundedFull
                .neumorphic(color: Vx.purple500, elevation: 30.0)
                .bgImage( DecorationImage(image: NetworkImage(bear)))
                .make().p8(),
                "User ".richText
                .withTextSpanChildren(["Login".textSpan.bold.make()])
                .white.xl2.make(),
              ].column(),
            ).makeCentered().h32(context),
                 
                    ClipRRect(
                   borderRadius: const BorderRadius.only(
                     topLeft: Radius.circular(50),
                     topRight: Radius.circular(50),
                           ),
                           // ignore: prefer_const_constructors
                           
                             child: SingleChildScrollView(
                               child: VxBox(child: VStack( [
                                                       Center(
                                                         child: SingleChildScrollView(
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children:<Widget> [
                                      
                                        emailField,
                                              const SizedBox(height: 20,width: 100),
                                              passwordField,
                                              const SizedBox(height: 20,width: 100),
                                      ElevatedButton(
                                        style:TextButton.styleFrom(backgroundColor:Vx.purple500),
                                        onPressed: (){
                                               signIn(emailController.text, passwordController.text);
                                              }, child: const Text("Sign in")),
                                                        
                                             Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                "Don't have an account? ".richText.bold.purple500.xl.make(),
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Registration()));

                                                },
                                                child: "User ".richText.bold.purple500.xl2.make(), 
                                              ),
                                              ],
                                             ),
                                                        
                                    ],
                                  ),
                                ),
                                                         ),
                                                       ),
                                                       
                               ]).px20().p16(),
                               
                               ).white.make(),
                             ),
                           
                         ).expand(),
                 
          ]),
 
);
  }

void signIn(String email,String password)async{
  if(_formKey.currentState!.validate()){
    await _auth
    .signInWithEmailAndPassword(email: email, password: password)
     .then((uid) => {
      Fluttertoast.showToast(msg: "Login Sucessful"),
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const NeumorphicPage()))
     }).catchError((e){
      Fluttertoast.showToast(msg: e!.unsucessful);
     });
  }
}

}