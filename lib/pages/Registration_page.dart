// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:welcome_screen/pages/neumorphic_page.dart';
import 'package:welcome_screen/pages/user_model.dart';






class Registration extends StatefulWidget{
  const Registration({Key? key}) : super(key: key);

  

  @override
  _Registration createState()=> _Registration();
}



class _Registration extends State<Registration>{

  final _auth = FirebaseAuth.instance;


  final _formKey = GlobalKey<FormState>();

  final bear = "https://c.tenor.com/mRHeooBie4IAAAAi/cute-animals-cute.gif";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  
   @override
  Widget build (BuildContext context){
    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return("Please Enter Name");
        }
        if(!regex.hasMatch(value)){
          return("Please Enter Valid Name upto 3 characters");

        }
        return null;
      },
      onSaved:(value){
        nameController.text= value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: const Icon(
          Icons.person_add_alt_1_outlined,
          color: Vx.purple500,
          
          ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Vx.purple500, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      
      ),
    );
    final surnameField = TextFormField(
      autofocus: false,
      controller: surnameController,
      keyboardType: TextInputType.name,
       validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return("Please Enter Surname");
        }
        if(!regex.hasMatch(value)){
          return("Please Enter Valid Surname upto 3 characters");

        }
        return null;
      },
      onSaved:(value){
        surnameController.text= value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: const Icon(
          Icons.person_add_alt_1_outlined,
          color: Vx.purple500,
          
          ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Surname",
        
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Vx.purple500, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

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
    final confirmPasswordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: confirmpasswordController,
      
      validator: (value) {
       if(confirmpasswordController.text!=passwordController.text)
       {
        return "Password does not match";
       }
       return null;
      },
      onSaved:(value){
        confirmpasswordController.text= value!;
      },
      textInputAction: TextInputAction.done,
      decoration:  InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key_off_rounded,
          color: Vx.purple500,
          ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        focusedBorder: OutlineInputBorder(
           borderSide: const BorderSide(color: Vx.purple500, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      
      ),
    );

    return MaterialApp(
       home: Scaffold(
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
    
      ]).pOnly(left: 16,top: 16),
      ),
      drawer: const Drawer(),
      body:  VStack([
      
                
              VxBox(
                
                child: [
                  VxBox().square(100).roundedFull
                  .neumorphic(color: Vx.purple500, elevation: 30.0)
                  .bgImage( DecorationImage(image: NetworkImage(bear)))
                  .make().p8(),
                  "User ".richText
                  .withTextSpanChildren(["Sign up".textSpan.bold.make()])
                  .white.xl2.make(),
                ].column(),
              ).makeCentered().h32(context),
                   
                      ClipRRect(
                     borderRadius: const BorderRadius.only(
                       topLeft: Radius.circular(50),
                       topRight: Radius.circular(50),
                             ),
                             child: SingleChildScrollView(
                                  child:
                                     VxBox(child: VStack( [
                                                             Center(
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          children:<Widget> [
                                            nameField,
                                                    const SizedBox(height: 20,width: 100),
                                                    surnameField,
                                                    const SizedBox(height: 20,width: 100),
                                            
                                              emailField,
                                                    const SizedBox(height: 20,width: 100),
                                                    passwordField,
                                                    const SizedBox(height: 20,width: 100),
                                                    
                                                    confirmPasswordField,
                                                    const SizedBox(height: 20,width: 100),
                                            ElevatedButton(
                                              style:TextButton.styleFrom(backgroundColor:Vx.purple500),
                                              onPressed: (){
                                                      signUp(emailController.text, passwordController.text);
                                                    }, child: const Text("Sign up")),
                                                              
                                                   
                                                              
                                          ],
                                        ),
                                      ),
                                                             ),
                                                             
                                     ]).px20().p16().expand(),
                                     
                                     ).white.make().expand(),
                                  
                                 
                               ).expand(),
                             
                           ).expand(),
                   
            ]),
     
    ).expand(),
    );
  }


  void signUp(String email,String password)async{

    if(_formKey.currentState!.validate()){

      await _auth
      .createUserWithEmailAndPassword(email:email,password: password)
         .then((value)=>{
          postDetailsToFirestore()
         }).catchError((e){
          Fluttertoast.showToast(msg: e!.message);
         });
    }
  }
  
  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameController.text;
    userModel.surname = surnameController.text;

    await firebaseFirestore
    .collection("users")
    .doc(user.uid)
    .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Sucessfully");

    // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const NeumorphicPage()), (route) => false);

   
  }



}